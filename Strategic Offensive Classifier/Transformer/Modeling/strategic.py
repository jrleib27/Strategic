import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from sklearn.cluster import KMeans

df=pd.read_csv('modeling.csv')
round_id=df[['unique_round_id']]
df=df.drop(columns=['unique_round_id'])

#trying out dropping the projected stats to see how it effects data
#df=df.drop(columns=['clinch_attempts_per_control','projected_offensive_clinch_time','projected_offensive_ground_time','projected_ground_control_time_per_takedown','%_offensive_clinch_strikes'])

df=df.replace(np.inf,0)

from sklearn import preprocessing
#measuring the silhouette score of the model
from sklearn.metrics import silhouette_score
# Prepare models
normalized_vectors = preprocessing.normalize(df)
normalized_kmeans = KMeans(n_clusters=4).fit(normalized_vectors)
# Print results
print('Cosine kmeans:{}'.format(silhouette_score(normalized_vectors,
                                          normalized_kmeans.labels_,
                                          metric='default',
                                          sample_size=8000)))