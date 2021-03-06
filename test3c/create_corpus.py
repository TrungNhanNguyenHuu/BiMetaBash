#!/usr/bin/env python3

from mrjob.job import MRJob
from mrjob.protocol import RawValueProtocol
from mrjob.protocol import TextProtocol
from mrjob.protocol import JSONProtocol

from gensim import corpora
from gensim.models.tfidfmodel import TfidfModel
from gensim.models import LogEntropyModel

import sys

#sys.path.append("../")  # Add "../" to utils folder path
from utils import globals

# Don't know why cannot use this:
# DICTIONARY_PATH = "hdfs://localhost:9000/user/dictionary.pkl"
# DICTIONARY_PATH = "/home/dhuy237/thesis/code/bimetaReduce/data/R4_medium/dictionary.pkl"
DICTIONARY_PATH = "/home/tnhan/Documents/dictionary.pkl"

def create_corpus(
    dictionary_path,
    documents,
    is_tfidf=False,
    smartirs=None,
    is_log_entropy=False,
    is_normalize=True,
):

    dictionary = dictionary_path
    # corpus = [dictionary.doc2bow(d, allow_update=True) for d in documents]
    corpus = dictionary.doc2bow(documents, allow_update=True)
    if is_tfidf:
        tfidf = TfidfModel(corpus=corpus, smartirs=smartirs)
        corpus = tfidf[corpus]
    elif is_log_entropy:
        log_entropy_model = LogEntropyModel(corpus, normalize=is_normalize)
        corpus = log_entropy_model[corpus]
    dictionary.save(DICTIONARY_PATH)
    return corpus


class CreateCorpus(MRJob):

    INPUT_PROTOCOL = JSONProtocol
    
    def configure_args(self):
        super(CreateCorpus, self).configure_args()
        self.add_file_arg("--dictionary")

    def mapper_init(self):
        self.dictionary = corpora.Dictionary.load(self.options.dictionary)

    def mapper(self, _, line):

        corpus = create_corpus(
            dictionary_path=self.dictionary,
            documents=line[3],
            is_tfidf=globals.IS_TFIDF,
            smartirs=globals.SMARTIRS,
        )
        yield None, (line[0], corpus)

    def reducer(self, key, values):
        for value in values:
            yield key, value


CreateCorpus.run()
