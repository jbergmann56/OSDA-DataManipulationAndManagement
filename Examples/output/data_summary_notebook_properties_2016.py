
"""
## import useful packages

"""

import pandas as pd
import numpy as np

import datetime

import matplotlib.pyplot as plt
import seaborn as sns
sns.set_style("white")

%matplotlib inline

from pydqc.data_summary import distribution_summary_pretty


"""
## assign values

"""

# the data table (pandas DataFrame)
table =
print("table size: " + str(table.shape))

# global values
VER_LINE = "#4BACC6"
TEXT_LIGHT = "#DAEEF3"
DIS_LINE = "#F79646"

# get date of today
snapshot_date_now = str(datetime.datetime.now().date())
print("date of today: " + snapshot_date_now)
"""
## parcelid (type: numeric)

"""

col = "parcelid"

value_df = table[[col]].copy()
nan_rate = value_df[value_df[col].isnull()].shape[0] * 1.0 / value_df.shape[0]
num_uni = value_df[col].dropna().nunique()

print("nan_rate: " + str(nan_rate))
print("num_uni out of " + str(value_df[col].dropna().shape[0]) + ": " + str(num_uni))

"""
#### check basic stats

"""

value_min=value_df[col].min()
value_mean=value_df[col].mean()
value_median=value_df[col].median()
value_max=value_df[col].max()

print("min: " + str(value_min))
print("mean: " + str(value_mean))
print("median: " + str(value_median))
print("max: " + str(value_max))

"""
#### check distribution

"""

value_dropna = value_df[col].dropna().values
plt.figure(figsize=(10, 5))
plt.title(col)
sns.distplot(value_dropna, color="#F79646", norm_hist=True, hist=False)

"""
"""

#you can also use the build-in draw function
distribution_summary_pretty(value_df, col, figsize=None, date_flag=False)
"""
## airconditioningtypeid (type: numeric)

"""

col = "airconditioningtypeid"

value_df = table[[col]].copy()
nan_rate = value_df[value_df[col].isnull()].shape[0] * 1.0 / value_df.shape[0]
num_uni = value_df[col].dropna().nunique()

print("nan_rate: " + str(nan_rate))
print("num_uni out of " + str(value_df[col].dropna().shape[0]) + ": " + str(num_uni))

"""
#### check basic stats

"""

value_min=value_df[col].min()
value_mean=value_df[col].mean()
value_median=value_df[col].median()
value_max=value_df[col].max()

print("min: " + str(value_min))
print("mean: " + str(value_mean))
print("median: " + str(value_median))
print("max: " + str(value_max))

"""
#### check distribution

"""

value_dropna = value_df[col].dropna().values
plt.figure(figsize=(10, 5))
plt.title(col)
sns.distplot(value_dropna, color="#F79646", norm_hist=True, hist=False)

"""
"""

#you can also use the build-in draw function
distribution_summary_pretty(value_df, col, figsize=None, date_flag=False)
"""
## architecturalstyletypeid (type: numeric)

"""

col = "architecturalstyletypeid"

value_df = table[[col]].copy()
nan_rate = value_df[value_df[col].isnull()].shape[0] * 1.0 / value_df.shape[0]
num_uni = value_df[col].dropna().nunique()

print("nan_rate: " + str(nan_rate))
print("num_uni out of " + str(value_df[col].dropna().shape[0]) + ": " + str(num_uni))

"""
#### check basic stats

"""

value_min=value_df[col].min()
value_mean=value_df[col].mean()
value_median=value_df[col].median()
value_max=value_df[col].max()

print("min: " + str(value_min))
print("mean: " + str(value_mean))
print("median: " + str(value_median))
print("max: " + str(value_max))

"""
#### check distribution

"""

value_dropna = value_df[col].dropna().values
plt.figure(figsize=(10, 5))
plt.title(col)
sns.distplot(value_dropna, color="#F79646", norm_hist=True, hist=False)

"""
"""

#you can also use the build-in draw function
distribution_summary_pretty(value_df, col, figsize=None, date_flag=False)
"""
## basementsqft (type: numeric)

"""

col = "basementsqft"

value_df = table[[col]].copy()
nan_rate = value_df[value_df[col].isnull()].shape[0] * 1.0 / value_df.shape[0]
num_uni = value_df[col].dropna().nunique()

print("nan_rate: " + str(nan_rate))
print("num_uni out of " + str(value_df[col].dropna().shape[0]) + ": " + str(num_uni))

"""
#### check basic stats

"""

value_min=value_df[col].min()
value_mean=value_df[col].mean()
value_median=value_df[col].median()
value_max=value_df[col].max()

print("min: " + str(value_min))
print("mean: " + str(value_mean))
print("median: " + str(value_median))
print("max: " + str(value_max))

"""
#### check distribution

"""

value_dropna = value_df[col].dropna().values
plt.figure(figsize=(10, 5))
plt.title(col)
sns.distplot(value_dropna, color="#F79646", norm_hist=True, hist=False)

"""
"""

#you can also use the build-in draw function
distribution_summary_pretty(value_df, col, figsize=None, date_flag=False)
"""
## bathroomcnt (type: numeric)

"""

col = "bathroomcnt"

value_df = table[[col]].copy()
nan_rate = value_df[value_df[col].isnull()].shape[0] * 1.0 / value_df.shape[0]
num_uni = value_df[col].dropna().nunique()

print("nan_rate: " + str(nan_rate))
print("num_uni out of " + str(value_df[col].dropna().shape[0]) + ": " + str(num_uni))

"""
#### check basic stats

"""

value_min=value_df[col].min()
value_mean=value_df[col].mean()
value_median=value_df[col].median()
value_max=value_df[col].max()

print("min: " + str(value_min))
print("mean: " + str(value_mean))
print("median: " + str(value_median))
print("max: " + str(value_max))

"""
#### check distribution

"""

value_dropna = value_df[col].dropna().values
plt.figure(figsize=(10, 5))
plt.title(col)
sns.distplot(value_dropna, color="#F79646", norm_hist=True, hist=False)

"""
"""

#you can also use the build-in draw function
distribution_summary_pretty(value_df, col, figsize=None, date_flag=False)
"""
## bedroomcnt (type: numeric)

"""

col = "bedroomcnt"

value_df = table[[col]].copy()
nan_rate = value_df[value_df[col].isnull()].shape[0] * 1.0 / value_df.shape[0]
num_uni = value_df[col].dropna().nunique()

print("nan_rate: " + str(nan_rate))
print("num_uni out of " + str(value_df[col].dropna().shape[0]) + ": " + str(num_uni))

"""
#### check basic stats

"""

value_min=value_df[col].min()
value_mean=value_df[col].mean()
value_median=value_df[col].median()
value_max=value_df[col].max()

print("min: " + str(value_min))
print("mean: " + str(value_mean))
print("median: " + str(value_median))
print("max: " + str(value_max))

"""
#### check distribution

"""

value_dropna = value_df[col].dropna().values
plt.figure(figsize=(10, 5))
plt.title(col)
sns.distplot(value_dropna, color="#F79646", norm_hist=True, hist=False)

"""
"""

#you can also use the build-in draw function
distribution_summary_pretty(value_df, col, figsize=None, date_flag=False)
"""
## buildingclasstypeid (type: numeric)

"""

col = "buildingclasstypeid"

value_df = table[[col]].copy()
nan_rate = value_df[value_df[col].isnull()].shape[0] * 1.0 / value_df.shape[0]
num_uni = value_df[col].dropna().nunique()

print("nan_rate: " + str(nan_rate))
print("num_uni out of " + str(value_df[col].dropna().shape[0]) + ": " + str(num_uni))

"""
#### check basic stats

"""

value_min=value_df[col].min()
value_mean=value_df[col].mean()
value_median=value_df[col].median()
value_max=value_df[col].max()

print("min: " + str(value_min))
print("mean: " + str(value_mean))
print("median: " + str(value_median))
print("max: " + str(value_max))

"""
#### check distribution

"""

value_dropna = value_df[col].dropna().values
plt.figure(figsize=(10, 5))
plt.title(col)
sns.distplot(value_dropna, color="#F79646", norm_hist=True, hist=False)

"""
"""

#you can also use the build-in draw function
distribution_summary_pretty(value_df, col, figsize=None, date_flag=False)
"""
## buildingqualitytypeid (type: numeric)

"""

col = "buildingqualitytypeid"

value_df = table[[col]].copy()
nan_rate = value_df[value_df[col].isnull()].shape[0] * 1.0 / value_df.shape[0]
num_uni = value_df[col].dropna().nunique()

print("nan_rate: " + str(nan_rate))
print("num_uni out of " + str(value_df[col].dropna().shape[0]) + ": " + str(num_uni))

"""
#### check basic stats

"""

value_min=value_df[col].min()
value_mean=value_df[col].mean()
value_median=value_df[col].median()
value_max=value_df[col].max()

print("min: " + str(value_min))
print("mean: " + str(value_mean))
print("median: " + str(value_median))
print("max: " + str(value_max))

"""
#### check distribution

"""

value_dropna = value_df[col].dropna().values
plt.figure(figsize=(10, 5))
plt.title(col)
sns.distplot(value_dropna, color="#F79646", norm_hist=True, hist=False)

"""
"""

#you can also use the build-in draw function
distribution_summary_pretty(value_df, col, figsize=None, date_flag=False)
"""
## calculatedbathnbr (type: numeric)

"""

col = "calculatedbathnbr"

value_df = table[[col]].copy()
nan_rate = value_df[value_df[col].isnull()].shape[0] * 1.0 / value_df.shape[0]
num_uni = value_df[col].dropna().nunique()

print("nan_rate: " + str(nan_rate))
print("num_uni out of " + str(value_df[col].dropna().shape[0]) + ": " + str(num_uni))

"""
#### check basic stats

"""

value_min=value_df[col].min()
value_mean=value_df[col].mean()
value_median=value_df[col].median()
value_max=value_df[col].max()

print("min: " + str(value_min))
print("mean: " + str(value_mean))
print("median: " + str(value_median))
print("max: " + str(value_max))

"""
#### check distribution

"""

value_dropna = value_df[col].dropna().values
plt.figure(figsize=(10, 5))
plt.title(col)
sns.distplot(value_dropna, color="#F79646", norm_hist=True, hist=False)

"""
"""

#you can also use the build-in draw function
distribution_summary_pretty(value_df, col, figsize=None, date_flag=False)
"""
## decktypeid (type: numeric)

"""

col = "decktypeid"

value_df = table[[col]].copy()
nan_rate = value_df[value_df[col].isnull()].shape[0] * 1.0 / value_df.shape[0]
num_uni = value_df[col].dropna().nunique()

print("nan_rate: " + str(nan_rate))
print("num_uni out of " + str(value_df[col].dropna().shape[0]) + ": " + str(num_uni))

"""
#### check basic stats

"""

value_min=value_df[col].min()
value_mean=value_df[col].mean()
value_median=value_df[col].median()
value_max=value_df[col].max()

print("min: " + str(value_min))
print("mean: " + str(value_mean))
print("median: " + str(value_median))
print("max: " + str(value_max))

"""
#### check distribution

"""

value_dropna = value_df[col].dropna().values
plt.figure(figsize=(10, 5))
plt.title(col)
sns.distplot(value_dropna, color="#F79646", norm_hist=True, hist=False)

"""
"""

#you can also use the build-in draw function
distribution_summary_pretty(value_df, col, figsize=None, date_flag=False)
"""
## finishedfloor1squarefeet (type: numeric)

"""

col = "finishedfloor1squarefeet"

value_df = table[[col]].copy()
nan_rate = value_df[value_df[col].isnull()].shape[0] * 1.0 / value_df.shape[0]
num_uni = value_df[col].dropna().nunique()

print("nan_rate: " + str(nan_rate))
print("num_uni out of " + str(value_df[col].dropna().shape[0]) + ": " + str(num_uni))

"""
#### check basic stats

"""

value_min=value_df[col].min()
value_mean=value_df[col].mean()
value_median=value_df[col].median()
value_max=value_df[col].max()

print("min: " + str(value_min))
print("mean: " + str(value_mean))
print("median: " + str(value_median))
print("max: " + str(value_max))

"""
#### check distribution

"""

value_dropna = value_df[col].dropna().values
plt.figure(figsize=(10, 5))
plt.title(col)
sns.distplot(value_dropna, color="#F79646", norm_hist=True, hist=False)

"""
"""

#you can also use the build-in draw function
distribution_summary_pretty(value_df, col, figsize=None, date_flag=False)
"""
## calculatedfinishedsquarefeet (type: numeric)

"""

col = "calculatedfinishedsquarefeet"

value_df = table[[col]].copy()
nan_rate = value_df[value_df[col].isnull()].shape[0] * 1.0 / value_df.shape[0]
num_uni = value_df[col].dropna().nunique()

print("nan_rate: " + str(nan_rate))
print("num_uni out of " + str(value_df[col].dropna().shape[0]) + ": " + str(num_uni))

"""
#### check basic stats

"""

value_min=value_df[col].min()
value_mean=value_df[col].mean()
value_median=value_df[col].median()
value_max=value_df[col].max()

print("min: " + str(value_min))
print("mean: " + str(value_mean))
print("median: " + str(value_median))
print("max: " + str(value_max))

"""
#### check distribution

"""

value_dropna = value_df[col].dropna().values
plt.figure(figsize=(10, 5))
plt.title(col)
sns.distplot(value_dropna, color="#F79646", norm_hist=True, hist=False)

"""
"""

#you can also use the build-in draw function
distribution_summary_pretty(value_df, col, figsize=None, date_flag=False)
"""
## finishedsquarefeet12 (type: numeric)

"""

col = "finishedsquarefeet12"

value_df = table[[col]].copy()
nan_rate = value_df[value_df[col].isnull()].shape[0] * 1.0 / value_df.shape[0]
num_uni = value_df[col].dropna().nunique()

print("nan_rate: " + str(nan_rate))
print("num_uni out of " + str(value_df[col].dropna().shape[0]) + ": " + str(num_uni))

"""
#### check basic stats

"""

value_min=value_df[col].min()
value_mean=value_df[col].mean()
value_median=value_df[col].median()
value_max=value_df[col].max()

print("min: " + str(value_min))
print("mean: " + str(value_mean))
print("median: " + str(value_median))
print("max: " + str(value_max))

"""
#### check distribution

"""

value_dropna = value_df[col].dropna().values
plt.figure(figsize=(10, 5))
plt.title(col)
sns.distplot(value_dropna, color="#F79646", norm_hist=True, hist=False)

"""
"""

#you can also use the build-in draw function
distribution_summary_pretty(value_df, col, figsize=None, date_flag=False)
"""
## finishedsquarefeet13 (type: numeric)

"""

col = "finishedsquarefeet13"

value_df = table[[col]].copy()
nan_rate = value_df[value_df[col].isnull()].shape[0] * 1.0 / value_df.shape[0]
num_uni = value_df[col].dropna().nunique()

print("nan_rate: " + str(nan_rate))
print("num_uni out of " + str(value_df[col].dropna().shape[0]) + ": " + str(num_uni))

"""
#### check basic stats

"""

value_min=value_df[col].min()
value_mean=value_df[col].mean()
value_median=value_df[col].median()
value_max=value_df[col].max()

print("min: " + str(value_min))
print("mean: " + str(value_mean))
print("median: " + str(value_median))
print("max: " + str(value_max))

"""
#### check distribution

"""

value_dropna = value_df[col].dropna().values
plt.figure(figsize=(10, 5))
plt.title(col)
sns.distplot(value_dropna, color="#F79646", norm_hist=True, hist=False)

"""
"""

#you can also use the build-in draw function
distribution_summary_pretty(value_df, col, figsize=None, date_flag=False)
"""
## finishedsquarefeet15 (type: numeric)

"""

col = "finishedsquarefeet15"

value_df = table[[col]].copy()
nan_rate = value_df[value_df[col].isnull()].shape[0] * 1.0 / value_df.shape[0]
num_uni = value_df[col].dropna().nunique()

print("nan_rate: " + str(nan_rate))
print("num_uni out of " + str(value_df[col].dropna().shape[0]) + ": " + str(num_uni))

"""
#### check basic stats

"""

value_min=value_df[col].min()
value_mean=value_df[col].mean()
value_median=value_df[col].median()
value_max=value_df[col].max()

print("min: " + str(value_min))
print("mean: " + str(value_mean))
print("median: " + str(value_median))
print("max: " + str(value_max))

"""
#### check distribution

"""

value_dropna = value_df[col].dropna().values
plt.figure(figsize=(10, 5))
plt.title(col)
sns.distplot(value_dropna, color="#F79646", norm_hist=True, hist=False)

"""
"""

#you can also use the build-in draw function
distribution_summary_pretty(value_df, col, figsize=None, date_flag=False)
"""
## finishedsquarefeet50 (type: numeric)

"""

col = "finishedsquarefeet50"

value_df = table[[col]].copy()
nan_rate = value_df[value_df[col].isnull()].shape[0] * 1.0 / value_df.shape[0]
num_uni = value_df[col].dropna().nunique()

print("nan_rate: " + str(nan_rate))
print("num_uni out of " + str(value_df[col].dropna().shape[0]) + ": " + str(num_uni))

"""
#### check basic stats

"""

value_min=value_df[col].min()
value_mean=value_df[col].mean()
value_median=value_df[col].median()
value_max=value_df[col].max()

print("min: " + str(value_min))
print("mean: " + str(value_mean))
print("median: " + str(value_median))
print("max: " + str(value_max))

"""
#### check distribution

"""

value_dropna = value_df[col].dropna().values
plt.figure(figsize=(10, 5))
plt.title(col)
sns.distplot(value_dropna, color="#F79646", norm_hist=True, hist=False)

"""
"""

#you can also use the build-in draw function
distribution_summary_pretty(value_df, col, figsize=None, date_flag=False)
"""
## finishedsquarefeet6 (type: numeric)

"""

col = "finishedsquarefeet6"

value_df = table[[col]].copy()
nan_rate = value_df[value_df[col].isnull()].shape[0] * 1.0 / value_df.shape[0]
num_uni = value_df[col].dropna().nunique()

print("nan_rate: " + str(nan_rate))
print("num_uni out of " + str(value_df[col].dropna().shape[0]) + ": " + str(num_uni))

"""
#### check basic stats

"""

value_min=value_df[col].min()
value_mean=value_df[col].mean()
value_median=value_df[col].median()
value_max=value_df[col].max()

print("min: " + str(value_min))
print("mean: " + str(value_mean))
print("median: " + str(value_median))
print("max: " + str(value_max))

"""
#### check distribution

"""

value_dropna = value_df[col].dropna().values
plt.figure(figsize=(10, 5))
plt.title(col)
sns.distplot(value_dropna, color="#F79646", norm_hist=True, hist=False)

"""
"""

#you can also use the build-in draw function
distribution_summary_pretty(value_df, col, figsize=None, date_flag=False)
"""
## fips (type: numeric)

"""

col = "fips"

value_df = table[[col]].copy()
nan_rate = value_df[value_df[col].isnull()].shape[0] * 1.0 / value_df.shape[0]
num_uni = value_df[col].dropna().nunique()

print("nan_rate: " + str(nan_rate))
print("num_uni out of " + str(value_df[col].dropna().shape[0]) + ": " + str(num_uni))

"""
#### check basic stats

"""

value_min=value_df[col].min()
value_mean=value_df[col].mean()
value_median=value_df[col].median()
value_max=value_df[col].max()

print("min: " + str(value_min))
print("mean: " + str(value_mean))
print("median: " + str(value_median))
print("max: " + str(value_max))

"""
#### check distribution

"""

value_dropna = value_df[col].dropna().values
plt.figure(figsize=(10, 5))
plt.title(col)
sns.distplot(value_dropna, color="#F79646", norm_hist=True, hist=False)

"""
"""

#you can also use the build-in draw function
distribution_summary_pretty(value_df, col, figsize=None, date_flag=False)
"""
## fireplacecnt (type: numeric)

"""

col = "fireplacecnt"

value_df = table[[col]].copy()
nan_rate = value_df[value_df[col].isnull()].shape[0] * 1.0 / value_df.shape[0]
num_uni = value_df[col].dropna().nunique()

print("nan_rate: " + str(nan_rate))
print("num_uni out of " + str(value_df[col].dropna().shape[0]) + ": " + str(num_uni))

"""
#### check basic stats

"""

value_min=value_df[col].min()
value_mean=value_df[col].mean()
value_median=value_df[col].median()
value_max=value_df[col].max()

print("min: " + str(value_min))
print("mean: " + str(value_mean))
print("median: " + str(value_median))
print("max: " + str(value_max))

"""
#### check distribution

"""

value_dropna = value_df[col].dropna().values
plt.figure(figsize=(10, 5))
plt.title(col)
sns.distplot(value_dropna, color="#F79646", norm_hist=True, hist=False)

"""
"""

#you can also use the build-in draw function
distribution_summary_pretty(value_df, col, figsize=None, date_flag=False)
"""
## fullbathcnt (type: numeric)

"""

col = "fullbathcnt"

value_df = table[[col]].copy()
nan_rate = value_df[value_df[col].isnull()].shape[0] * 1.0 / value_df.shape[0]
num_uni = value_df[col].dropna().nunique()

print("nan_rate: " + str(nan_rate))
print("num_uni out of " + str(value_df[col].dropna().shape[0]) + ": " + str(num_uni))

"""
#### check basic stats

"""

value_min=value_df[col].min()
value_mean=value_df[col].mean()
value_median=value_df[col].median()
value_max=value_df[col].max()

print("min: " + str(value_min))
print("mean: " + str(value_mean))
print("median: " + str(value_median))
print("max: " + str(value_max))

"""
#### check distribution

"""

value_dropna = value_df[col].dropna().values
plt.figure(figsize=(10, 5))
plt.title(col)
sns.distplot(value_dropna, color="#F79646", norm_hist=True, hist=False)

"""
"""

#you can also use the build-in draw function
distribution_summary_pretty(value_df, col, figsize=None, date_flag=False)
"""
## garagecarcnt (type: numeric)

"""

col = "garagecarcnt"

value_df = table[[col]].copy()
nan_rate = value_df[value_df[col].isnull()].shape[0] * 1.0 / value_df.shape[0]
num_uni = value_df[col].dropna().nunique()

print("nan_rate: " + str(nan_rate))
print("num_uni out of " + str(value_df[col].dropna().shape[0]) + ": " + str(num_uni))

"""
#### check basic stats

"""

value_min=value_df[col].min()
value_mean=value_df[col].mean()
value_median=value_df[col].median()
value_max=value_df[col].max()

print("min: " + str(value_min))
print("mean: " + str(value_mean))
print("median: " + str(value_median))
print("max: " + str(value_max))

"""
#### check distribution

"""

value_dropna = value_df[col].dropna().values
plt.figure(figsize=(10, 5))
plt.title(col)
sns.distplot(value_dropna, color="#F79646", norm_hist=True, hist=False)

"""
"""

#you can also use the build-in draw function
distribution_summary_pretty(value_df, col, figsize=None, date_flag=False)
"""
## garagetotalsqft (type: numeric)

"""

col = "garagetotalsqft"

value_df = table[[col]].copy()
nan_rate = value_df[value_df[col].isnull()].shape[0] * 1.0 / value_df.shape[0]
num_uni = value_df[col].dropna().nunique()

print("nan_rate: " + str(nan_rate))
print("num_uni out of " + str(value_df[col].dropna().shape[0]) + ": " + str(num_uni))

"""
#### check basic stats

"""

value_min=value_df[col].min()
value_mean=value_df[col].mean()
value_median=value_df[col].median()
value_max=value_df[col].max()

print("min: " + str(value_min))
print("mean: " + str(value_mean))
print("median: " + str(value_median))
print("max: " + str(value_max))

"""
#### check distribution

"""

value_dropna = value_df[col].dropna().values
plt.figure(figsize=(10, 5))
plt.title(col)
sns.distplot(value_dropna, color="#F79646", norm_hist=True, hist=False)

"""
"""

#you can also use the build-in draw function
distribution_summary_pretty(value_df, col, figsize=None, date_flag=False)
"""
## hashottuborspa (type: str)

"""

col = "hashottuborspa"

value_df = table[[col]].copy()
nan_rate = value_df[value_df[col].isnull()].shape[0] * 1.0 / value_df.shape[0]
num_uni = value_df[col].dropna().nunique()

print("nan_rate: " + str(nan_rate))
print("num_uni out of " + str(value_df[col].dropna().shape[0]) + ": " + str(num_uni))

"""
#### check value counts

"""

value_df[col].value_counts().head(10)
"""
## heatingorsystemtypeid (type: numeric)

"""

col = "heatingorsystemtypeid"

value_df = table[[col]].copy()
nan_rate = value_df[value_df[col].isnull()].shape[0] * 1.0 / value_df.shape[0]
num_uni = value_df[col].dropna().nunique()

print("nan_rate: " + str(nan_rate))
print("num_uni out of " + str(value_df[col].dropna().shape[0]) + ": " + str(num_uni))

"""
#### check basic stats

"""

value_min=value_df[col].min()
value_mean=value_df[col].mean()
value_median=value_df[col].median()
value_max=value_df[col].max()

print("min: " + str(value_min))
print("mean: " + str(value_mean))
print("median: " + str(value_median))
print("max: " + str(value_max))

"""
#### check distribution

"""

value_dropna = value_df[col].dropna().values
plt.figure(figsize=(10, 5))
plt.title(col)
sns.distplot(value_dropna, color="#F79646", norm_hist=True, hist=False)

"""
"""

#you can also use the build-in draw function
distribution_summary_pretty(value_df, col, figsize=None, date_flag=False)
"""
## latitude (type: numeric)

"""

col = "latitude"

value_df = table[[col]].copy()
nan_rate = value_df[value_df[col].isnull()].shape[0] * 1.0 / value_df.shape[0]
num_uni = value_df[col].dropna().nunique()

print("nan_rate: " + str(nan_rate))
print("num_uni out of " + str(value_df[col].dropna().shape[0]) + ": " + str(num_uni))

"""
#### check basic stats

"""

value_min=value_df[col].min()
value_mean=value_df[col].mean()
value_median=value_df[col].median()
value_max=value_df[col].max()

print("min: " + str(value_min))
print("mean: " + str(value_mean))
print("median: " + str(value_median))
print("max: " + str(value_max))

"""
#### check distribution

"""

value_dropna = value_df[col].dropna().values
plt.figure(figsize=(10, 5))
plt.title(col)
sns.distplot(value_dropna, color="#F79646", norm_hist=True, hist=False)

"""
"""

#you can also use the build-in draw function
distribution_summary_pretty(value_df, col, figsize=None, date_flag=False)
"""
## longitude (type: numeric)

"""

col = "longitude"

value_df = table[[col]].copy()
nan_rate = value_df[value_df[col].isnull()].shape[0] * 1.0 / value_df.shape[0]
num_uni = value_df[col].dropna().nunique()

print("nan_rate: " + str(nan_rate))
print("num_uni out of " + str(value_df[col].dropna().shape[0]) + ": " + str(num_uni))

"""
#### check basic stats

"""

value_min=value_df[col].min()
value_mean=value_df[col].mean()
value_median=value_df[col].median()
value_max=value_df[col].max()

print("min: " + str(value_min))
print("mean: " + str(value_mean))
print("median: " + str(value_median))
print("max: " + str(value_max))

"""
#### check distribution

"""

value_dropna = value_df[col].dropna().values
plt.figure(figsize=(10, 5))
plt.title(col)
sns.distplot(value_dropna, color="#F79646", norm_hist=True, hist=False)

"""
"""

#you can also use the build-in draw function
distribution_summary_pretty(value_df, col, figsize=None, date_flag=False)
"""
## lotsizesquarefeet (type: numeric)

"""

col = "lotsizesquarefeet"

value_df = table[[col]].copy()
nan_rate = value_df[value_df[col].isnull()].shape[0] * 1.0 / value_df.shape[0]
num_uni = value_df[col].dropna().nunique()

print("nan_rate: " + str(nan_rate))
print("num_uni out of " + str(value_df[col].dropna().shape[0]) + ": " + str(num_uni))

"""
#### check basic stats

"""

value_min=value_df[col].min()
value_mean=value_df[col].mean()
value_median=value_df[col].median()
value_max=value_df[col].max()

print("min: " + str(value_min))
print("mean: " + str(value_mean))
print("median: " + str(value_median))
print("max: " + str(value_max))

"""
#### check distribution

"""

value_dropna = value_df[col].dropna().values
plt.figure(figsize=(10, 5))
plt.title(col)
sns.distplot(value_dropna, color="#F79646", norm_hist=True, hist=False)

"""
"""

#you can also use the build-in draw function
distribution_summary_pretty(value_df, col, figsize=None, date_flag=False)
"""
## poolcnt (type: numeric)

"""

col = "poolcnt"

value_df = table[[col]].copy()
nan_rate = value_df[value_df[col].isnull()].shape[0] * 1.0 / value_df.shape[0]
num_uni = value_df[col].dropna().nunique()

print("nan_rate: " + str(nan_rate))
print("num_uni out of " + str(value_df[col].dropna().shape[0]) + ": " + str(num_uni))

"""
#### check basic stats

"""

value_min=value_df[col].min()
value_mean=value_df[col].mean()
value_median=value_df[col].median()
value_max=value_df[col].max()

print("min: " + str(value_min))
print("mean: " + str(value_mean))
print("median: " + str(value_median))
print("max: " + str(value_max))

"""
#### check distribution

"""

value_dropna = value_df[col].dropna().values
plt.figure(figsize=(10, 5))
plt.title(col)
sns.distplot(value_dropna, color="#F79646", norm_hist=True, hist=False)

"""
"""

#you can also use the build-in draw function
distribution_summary_pretty(value_df, col, figsize=None, date_flag=False)
"""
## poolsizesum (type: numeric)

"""

col = "poolsizesum"

value_df = table[[col]].copy()
nan_rate = value_df[value_df[col].isnull()].shape[0] * 1.0 / value_df.shape[0]
num_uni = value_df[col].dropna().nunique()

print("nan_rate: " + str(nan_rate))
print("num_uni out of " + str(value_df[col].dropna().shape[0]) + ": " + str(num_uni))

"""
#### check basic stats

"""

value_min=value_df[col].min()
value_mean=value_df[col].mean()
value_median=value_df[col].median()
value_max=value_df[col].max()

print("min: " + str(value_min))
print("mean: " + str(value_mean))
print("median: " + str(value_median))
print("max: " + str(value_max))

"""
#### check distribution

"""

value_dropna = value_df[col].dropna().values
plt.figure(figsize=(10, 5))
plt.title(col)
sns.distplot(value_dropna, color="#F79646", norm_hist=True, hist=False)

"""
"""

#you can also use the build-in draw function
distribution_summary_pretty(value_df, col, figsize=None, date_flag=False)
"""
## pooltypeid10 (type: numeric)

"""

col = "pooltypeid10"

value_df = table[[col]].copy()
nan_rate = value_df[value_df[col].isnull()].shape[0] * 1.0 / value_df.shape[0]
num_uni = value_df[col].dropna().nunique()

print("nan_rate: " + str(nan_rate))
print("num_uni out of " + str(value_df[col].dropna().shape[0]) + ": " + str(num_uni))

"""
#### check basic stats

"""

value_min=value_df[col].min()
value_mean=value_df[col].mean()
value_median=value_df[col].median()
value_max=value_df[col].max()

print("min: " + str(value_min))
print("mean: " + str(value_mean))
print("median: " + str(value_median))
print("max: " + str(value_max))

"""
#### check distribution

"""

value_dropna = value_df[col].dropna().values
plt.figure(figsize=(10, 5))
plt.title(col)
sns.distplot(value_dropna, color="#F79646", norm_hist=True, hist=False)

"""
"""

#you can also use the build-in draw function
distribution_summary_pretty(value_df, col, figsize=None, date_flag=False)
"""
## pooltypeid2 (type: numeric)

"""

col = "pooltypeid2"

value_df = table[[col]].copy()
nan_rate = value_df[value_df[col].isnull()].shape[0] * 1.0 / value_df.shape[0]
num_uni = value_df[col].dropna().nunique()

print("nan_rate: " + str(nan_rate))
print("num_uni out of " + str(value_df[col].dropna().shape[0]) + ": " + str(num_uni))

"""
#### check basic stats

"""

value_min=value_df[col].min()
value_mean=value_df[col].mean()
value_median=value_df[col].median()
value_max=value_df[col].max()

print("min: " + str(value_min))
print("mean: " + str(value_mean))
print("median: " + str(value_median))
print("max: " + str(value_max))

"""
#### check distribution

"""

value_dropna = value_df[col].dropna().values
plt.figure(figsize=(10, 5))
plt.title(col)
sns.distplot(value_dropna, color="#F79646", norm_hist=True, hist=False)

"""
"""

#you can also use the build-in draw function
distribution_summary_pretty(value_df, col, figsize=None, date_flag=False)
"""
## pooltypeid7 (type: numeric)

"""

col = "pooltypeid7"

value_df = table[[col]].copy()
nan_rate = value_df[value_df[col].isnull()].shape[0] * 1.0 / value_df.shape[0]
num_uni = value_df[col].dropna().nunique()

print("nan_rate: " + str(nan_rate))
print("num_uni out of " + str(value_df[col].dropna().shape[0]) + ": " + str(num_uni))

"""
#### check basic stats

"""

value_min=value_df[col].min()
value_mean=value_df[col].mean()
value_median=value_df[col].median()
value_max=value_df[col].max()

print("min: " + str(value_min))
print("mean: " + str(value_mean))
print("median: " + str(value_median))
print("max: " + str(value_max))

"""
#### check distribution

"""

value_dropna = value_df[col].dropna().values
plt.figure(figsize=(10, 5))
plt.title(col)
sns.distplot(value_dropna, color="#F79646", norm_hist=True, hist=False)

"""
"""

#you can also use the build-in draw function
distribution_summary_pretty(value_df, col, figsize=None, date_flag=False)
"""
## propertycountylandusecode (type: str)

"""

col = "propertycountylandusecode"

value_df = table[[col]].copy()
nan_rate = value_df[value_df[col].isnull()].shape[0] * 1.0 / value_df.shape[0]
num_uni = value_df[col].dropna().nunique()

print("nan_rate: " + str(nan_rate))
print("num_uni out of " + str(value_df[col].dropna().shape[0]) + ": " + str(num_uni))

"""
#### check value counts

"""

value_df[col].value_counts().head(10)
"""
## propertylandusetypeid (type: numeric)

"""

col = "propertylandusetypeid"

value_df = table[[col]].copy()
nan_rate = value_df[value_df[col].isnull()].shape[0] * 1.0 / value_df.shape[0]
num_uni = value_df[col].dropna().nunique()

print("nan_rate: " + str(nan_rate))
print("num_uni out of " + str(value_df[col].dropna().shape[0]) + ": " + str(num_uni))

"""
#### check basic stats

"""

value_min=value_df[col].min()
value_mean=value_df[col].mean()
value_median=value_df[col].median()
value_max=value_df[col].max()

print("min: " + str(value_min))
print("mean: " + str(value_mean))
print("median: " + str(value_median))
print("max: " + str(value_max))

"""
#### check distribution

"""

value_dropna = value_df[col].dropna().values
plt.figure(figsize=(10, 5))
plt.title(col)
sns.distplot(value_dropna, color="#F79646", norm_hist=True, hist=False)

"""
"""

#you can also use the build-in draw function
distribution_summary_pretty(value_df, col, figsize=None, date_flag=False)
"""
## propertyzoningdesc (type: str)

"""

col = "propertyzoningdesc"

value_df = table[[col]].copy()
nan_rate = value_df[value_df[col].isnull()].shape[0] * 1.0 / value_df.shape[0]
num_uni = value_df[col].dropna().nunique()

print("nan_rate: " + str(nan_rate))
print("num_uni out of " + str(value_df[col].dropna().shape[0]) + ": " + str(num_uni))

"""
#### check value counts

"""

value_df[col].value_counts().head(10)
"""
## rawcensustractandblock (type: numeric)

"""

col = "rawcensustractandblock"

value_df = table[[col]].copy()
nan_rate = value_df[value_df[col].isnull()].shape[0] * 1.0 / value_df.shape[0]
num_uni = value_df[col].dropna().nunique()

print("nan_rate: " + str(nan_rate))
print("num_uni out of " + str(value_df[col].dropna().shape[0]) + ": " + str(num_uni))

"""
#### check basic stats

"""

value_min=value_df[col].min()
value_mean=value_df[col].mean()
value_median=value_df[col].median()
value_max=value_df[col].max()

print("min: " + str(value_min))
print("mean: " + str(value_mean))
print("median: " + str(value_median))
print("max: " + str(value_max))

"""
#### check distribution

"""

value_dropna = value_df[col].dropna().values
plt.figure(figsize=(10, 5))
plt.title(col)
sns.distplot(value_dropna, color="#F79646", norm_hist=True, hist=False)

"""
"""

#you can also use the build-in draw function
distribution_summary_pretty(value_df, col, figsize=None, date_flag=False)
"""
## regionidcity (type: numeric)

"""

col = "regionidcity"

value_df = table[[col]].copy()
nan_rate = value_df[value_df[col].isnull()].shape[0] * 1.0 / value_df.shape[0]
num_uni = value_df[col].dropna().nunique()

print("nan_rate: " + str(nan_rate))
print("num_uni out of " + str(value_df[col].dropna().shape[0]) + ": " + str(num_uni))

"""
#### check basic stats

"""

value_min=value_df[col].min()
value_mean=value_df[col].mean()
value_median=value_df[col].median()
value_max=value_df[col].max()

print("min: " + str(value_min))
print("mean: " + str(value_mean))
print("median: " + str(value_median))
print("max: " + str(value_max))

"""
#### check distribution

"""

value_dropna = value_df[col].dropna().values
plt.figure(figsize=(10, 5))
plt.title(col)
sns.distplot(value_dropna, color="#F79646", norm_hist=True, hist=False)

"""
"""

#you can also use the build-in draw function
distribution_summary_pretty(value_df, col, figsize=None, date_flag=False)
"""
## regionidcounty (type: numeric)

"""

col = "regionidcounty"

value_df = table[[col]].copy()
nan_rate = value_df[value_df[col].isnull()].shape[0] * 1.0 / value_df.shape[0]
num_uni = value_df[col].dropna().nunique()

print("nan_rate: " + str(nan_rate))
print("num_uni out of " + str(value_df[col].dropna().shape[0]) + ": " + str(num_uni))

"""
#### check basic stats

"""

value_min=value_df[col].min()
value_mean=value_df[col].mean()
value_median=value_df[col].median()
value_max=value_df[col].max()

print("min: " + str(value_min))
print("mean: " + str(value_mean))
print("median: " + str(value_median))
print("max: " + str(value_max))

"""
#### check distribution

"""

value_dropna = value_df[col].dropna().values
plt.figure(figsize=(10, 5))
plt.title(col)
sns.distplot(value_dropna, color="#F79646", norm_hist=True, hist=False)

"""
"""

#you can also use the build-in draw function
distribution_summary_pretty(value_df, col, figsize=None, date_flag=False)
"""
## regionidneighborhood (type: numeric)

"""

col = "regionidneighborhood"

value_df = table[[col]].copy()
nan_rate = value_df[value_df[col].isnull()].shape[0] * 1.0 / value_df.shape[0]
num_uni = value_df[col].dropna().nunique()

print("nan_rate: " + str(nan_rate))
print("num_uni out of " + str(value_df[col].dropna().shape[0]) + ": " + str(num_uni))

"""
#### check basic stats

"""

value_min=value_df[col].min()
value_mean=value_df[col].mean()
value_median=value_df[col].median()
value_max=value_df[col].max()

print("min: " + str(value_min))
print("mean: " + str(value_mean))
print("median: " + str(value_median))
print("max: " + str(value_max))

"""
#### check distribution

"""

value_dropna = value_df[col].dropna().values
plt.figure(figsize=(10, 5))
plt.title(col)
sns.distplot(value_dropna, color="#F79646", norm_hist=True, hist=False)

"""
"""

#you can also use the build-in draw function
distribution_summary_pretty(value_df, col, figsize=None, date_flag=False)
"""
## regionidzip (type: numeric)

"""

col = "regionidzip"

value_df = table[[col]].copy()
nan_rate = value_df[value_df[col].isnull()].shape[0] * 1.0 / value_df.shape[0]
num_uni = value_df[col].dropna().nunique()

print("nan_rate: " + str(nan_rate))
print("num_uni out of " + str(value_df[col].dropna().shape[0]) + ": " + str(num_uni))

"""
#### check basic stats

"""

value_min=value_df[col].min()
value_mean=value_df[col].mean()
value_median=value_df[col].median()
value_max=value_df[col].max()

print("min: " + str(value_min))
print("mean: " + str(value_mean))
print("median: " + str(value_median))
print("max: " + str(value_max))

"""
#### check distribution

"""

value_dropna = value_df[col].dropna().values
plt.figure(figsize=(10, 5))
plt.title(col)
sns.distplot(value_dropna, color="#F79646", norm_hist=True, hist=False)

"""
"""

#you can also use the build-in draw function
distribution_summary_pretty(value_df, col, figsize=None, date_flag=False)
"""
## roomcnt (type: numeric)

"""

col = "roomcnt"

value_df = table[[col]].copy()
nan_rate = value_df[value_df[col].isnull()].shape[0] * 1.0 / value_df.shape[0]
num_uni = value_df[col].dropna().nunique()

print("nan_rate: " + str(nan_rate))
print("num_uni out of " + str(value_df[col].dropna().shape[0]) + ": " + str(num_uni))

"""
#### check basic stats

"""

value_min=value_df[col].min()
value_mean=value_df[col].mean()
value_median=value_df[col].median()
value_max=value_df[col].max()

print("min: " + str(value_min))
print("mean: " + str(value_mean))
print("median: " + str(value_median))
print("max: " + str(value_max))

"""
#### check distribution

"""

value_dropna = value_df[col].dropna().values
plt.figure(figsize=(10, 5))
plt.title(col)
sns.distplot(value_dropna, color="#F79646", norm_hist=True, hist=False)

"""
"""

#you can also use the build-in draw function
distribution_summary_pretty(value_df, col, figsize=None, date_flag=False)
"""
## storytypeid (type: numeric)

"""

col = "storytypeid"

value_df = table[[col]].copy()
nan_rate = value_df[value_df[col].isnull()].shape[0] * 1.0 / value_df.shape[0]
num_uni = value_df[col].dropna().nunique()

print("nan_rate: " + str(nan_rate))
print("num_uni out of " + str(value_df[col].dropna().shape[0]) + ": " + str(num_uni))

"""
#### check basic stats

"""

value_min=value_df[col].min()
value_mean=value_df[col].mean()
value_median=value_df[col].median()
value_max=value_df[col].max()

print("min: " + str(value_min))
print("mean: " + str(value_mean))
print("median: " + str(value_median))
print("max: " + str(value_max))

"""
#### check distribution

"""

value_dropna = value_df[col].dropna().values
plt.figure(figsize=(10, 5))
plt.title(col)
sns.distplot(value_dropna, color="#F79646", norm_hist=True, hist=False)

"""
"""

#you can also use the build-in draw function
distribution_summary_pretty(value_df, col, figsize=None, date_flag=False)
"""
## threequarterbathnbr (type: numeric)

"""

col = "threequarterbathnbr"

value_df = table[[col]].copy()
nan_rate = value_df[value_df[col].isnull()].shape[0] * 1.0 / value_df.shape[0]
num_uni = value_df[col].dropna().nunique()

print("nan_rate: " + str(nan_rate))
print("num_uni out of " + str(value_df[col].dropna().shape[0]) + ": " + str(num_uni))

"""
#### check basic stats

"""

value_min=value_df[col].min()
value_mean=value_df[col].mean()
value_median=value_df[col].median()
value_max=value_df[col].max()

print("min: " + str(value_min))
print("mean: " + str(value_mean))
print("median: " + str(value_median))
print("max: " + str(value_max))

"""
#### check distribution

"""

value_dropna = value_df[col].dropna().values
plt.figure(figsize=(10, 5))
plt.title(col)
sns.distplot(value_dropna, color="#F79646", norm_hist=True, hist=False)

"""
"""

#you can also use the build-in draw function
distribution_summary_pretty(value_df, col, figsize=None, date_flag=False)
"""
## typeconstructiontypeid (type: numeric)

"""

col = "typeconstructiontypeid"

value_df = table[[col]].copy()
nan_rate = value_df[value_df[col].isnull()].shape[0] * 1.0 / value_df.shape[0]
num_uni = value_df[col].dropna().nunique()

print("nan_rate: " + str(nan_rate))
print("num_uni out of " + str(value_df[col].dropna().shape[0]) + ": " + str(num_uni))

"""
#### check basic stats

"""

value_min=value_df[col].min()
value_mean=value_df[col].mean()
value_median=value_df[col].median()
value_max=value_df[col].max()

print("min: " + str(value_min))
print("mean: " + str(value_mean))
print("median: " + str(value_median))
print("max: " + str(value_max))

"""
#### check distribution

"""

value_dropna = value_df[col].dropna().values
plt.figure(figsize=(10, 5))
plt.title(col)
sns.distplot(value_dropna, color="#F79646", norm_hist=True, hist=False)

"""
"""

#you can also use the build-in draw function
distribution_summary_pretty(value_df, col, figsize=None, date_flag=False)
"""
## unitcnt (type: numeric)

"""

col = "unitcnt"

value_df = table[[col]].copy()
nan_rate = value_df[value_df[col].isnull()].shape[0] * 1.0 / value_df.shape[0]
num_uni = value_df[col].dropna().nunique()

print("nan_rate: " + str(nan_rate))
print("num_uni out of " + str(value_df[col].dropna().shape[0]) + ": " + str(num_uni))

"""
#### check basic stats

"""

value_min=value_df[col].min()
value_mean=value_df[col].mean()
value_median=value_df[col].median()
value_max=value_df[col].max()

print("min: " + str(value_min))
print("mean: " + str(value_mean))
print("median: " + str(value_median))
print("max: " + str(value_max))

"""
#### check distribution

"""

value_dropna = value_df[col].dropna().values
plt.figure(figsize=(10, 5))
plt.title(col)
sns.distplot(value_dropna, color="#F79646", norm_hist=True, hist=False)

"""
"""

#you can also use the build-in draw function
distribution_summary_pretty(value_df, col, figsize=None, date_flag=False)
"""
## yardbuildingsqft17 (type: numeric)

"""

col = "yardbuildingsqft17"

value_df = table[[col]].copy()
nan_rate = value_df[value_df[col].isnull()].shape[0] * 1.0 / value_df.shape[0]
num_uni = value_df[col].dropna().nunique()

print("nan_rate: " + str(nan_rate))
print("num_uni out of " + str(value_df[col].dropna().shape[0]) + ": " + str(num_uni))

"""
#### check basic stats

"""

value_min=value_df[col].min()
value_mean=value_df[col].mean()
value_median=value_df[col].median()
value_max=value_df[col].max()

print("min: " + str(value_min))
print("mean: " + str(value_mean))
print("median: " + str(value_median))
print("max: " + str(value_max))

"""
#### check distribution

"""

value_dropna = value_df[col].dropna().values
plt.figure(figsize=(10, 5))
plt.title(col)
sns.distplot(value_dropna, color="#F79646", norm_hist=True, hist=False)

"""
"""

#you can also use the build-in draw function
distribution_summary_pretty(value_df, col, figsize=None, date_flag=False)
"""
## yardbuildingsqft26 (type: numeric)

"""

col = "yardbuildingsqft26"

value_df = table[[col]].copy()
nan_rate = value_df[value_df[col].isnull()].shape[0] * 1.0 / value_df.shape[0]
num_uni = value_df[col].dropna().nunique()

print("nan_rate: " + str(nan_rate))
print("num_uni out of " + str(value_df[col].dropna().shape[0]) + ": " + str(num_uni))

"""
#### check basic stats

"""

value_min=value_df[col].min()
value_mean=value_df[col].mean()
value_median=value_df[col].median()
value_max=value_df[col].max()

print("min: " + str(value_min))
print("mean: " + str(value_mean))
print("median: " + str(value_median))
print("max: " + str(value_max))

"""
#### check distribution

"""

value_dropna = value_df[col].dropna().values
plt.figure(figsize=(10, 5))
plt.title(col)
sns.distplot(value_dropna, color="#F79646", norm_hist=True, hist=False)

"""
"""

#you can also use the build-in draw function
distribution_summary_pretty(value_df, col, figsize=None, date_flag=False)
"""
## yearbuilt (type: numeric)

"""

col = "yearbuilt"

value_df = table[[col]].copy()
nan_rate = value_df[value_df[col].isnull()].shape[0] * 1.0 / value_df.shape[0]
num_uni = value_df[col].dropna().nunique()

print("nan_rate: " + str(nan_rate))
print("num_uni out of " + str(value_df[col].dropna().shape[0]) + ": " + str(num_uni))

"""
#### check basic stats

"""

value_min=value_df[col].min()
value_mean=value_df[col].mean()
value_median=value_df[col].median()
value_max=value_df[col].max()

print("min: " + str(value_min))
print("mean: " + str(value_mean))
print("median: " + str(value_median))
print("max: " + str(value_max))

"""
#### check distribution

"""

value_dropna = value_df[col].dropna().values
plt.figure(figsize=(10, 5))
plt.title(col)
sns.distplot(value_dropna, color="#F79646", norm_hist=True, hist=False)

"""
"""

#you can also use the build-in draw function
distribution_summary_pretty(value_df, col, figsize=None, date_flag=False)
"""
## numberofstories (type: numeric)

"""

col = "numberofstories"

value_df = table[[col]].copy()
nan_rate = value_df[value_df[col].isnull()].shape[0] * 1.0 / value_df.shape[0]
num_uni = value_df[col].dropna().nunique()

print("nan_rate: " + str(nan_rate))
print("num_uni out of " + str(value_df[col].dropna().shape[0]) + ": " + str(num_uni))

"""
#### check basic stats

"""

value_min=value_df[col].min()
value_mean=value_df[col].mean()
value_median=value_df[col].median()
value_max=value_df[col].max()

print("min: " + str(value_min))
print("mean: " + str(value_mean))
print("median: " + str(value_median))
print("max: " + str(value_max))

"""
#### check distribution

"""

value_dropna = value_df[col].dropna().values
plt.figure(figsize=(10, 5))
plt.title(col)
sns.distplot(value_dropna, color="#F79646", norm_hist=True, hist=False)

"""
"""

#you can also use the build-in draw function
distribution_summary_pretty(value_df, col, figsize=None, date_flag=False)
"""
## fireplaceflag (type: str)

"""

col = "fireplaceflag"

value_df = table[[col]].copy()
nan_rate = value_df[value_df[col].isnull()].shape[0] * 1.0 / value_df.shape[0]
num_uni = value_df[col].dropna().nunique()

print("nan_rate: " + str(nan_rate))
print("num_uni out of " + str(value_df[col].dropna().shape[0]) + ": " + str(num_uni))

"""
#### check value counts

"""

value_df[col].value_counts().head(10)
"""
## structuretaxvaluedollarcnt (type: numeric)

"""

col = "structuretaxvaluedollarcnt"

value_df = table[[col]].copy()
nan_rate = value_df[value_df[col].isnull()].shape[0] * 1.0 / value_df.shape[0]
num_uni = value_df[col].dropna().nunique()

print("nan_rate: " + str(nan_rate))
print("num_uni out of " + str(value_df[col].dropna().shape[0]) + ": " + str(num_uni))

"""
#### check basic stats

"""

value_min=value_df[col].min()
value_mean=value_df[col].mean()
value_median=value_df[col].median()
value_max=value_df[col].max()

print("min: " + str(value_min))
print("mean: " + str(value_mean))
print("median: " + str(value_median))
print("max: " + str(value_max))

"""
#### check distribution

"""

value_dropna = value_df[col].dropna().values
plt.figure(figsize=(10, 5))
plt.title(col)
sns.distplot(value_dropna, color="#F79646", norm_hist=True, hist=False)

"""
"""

#you can also use the build-in draw function
distribution_summary_pretty(value_df, col, figsize=None, date_flag=False)
"""
## taxvaluedollarcnt (type: numeric)

"""

col = "taxvaluedollarcnt"

value_df = table[[col]].copy()
nan_rate = value_df[value_df[col].isnull()].shape[0] * 1.0 / value_df.shape[0]
num_uni = value_df[col].dropna().nunique()

print("nan_rate: " + str(nan_rate))
print("num_uni out of " + str(value_df[col].dropna().shape[0]) + ": " + str(num_uni))

"""
#### check basic stats

"""

value_min=value_df[col].min()
value_mean=value_df[col].mean()
value_median=value_df[col].median()
value_max=value_df[col].max()

print("min: " + str(value_min))
print("mean: " + str(value_mean))
print("median: " + str(value_median))
print("max: " + str(value_max))

"""
#### check distribution

"""

value_dropna = value_df[col].dropna().values
plt.figure(figsize=(10, 5))
plt.title(col)
sns.distplot(value_dropna, color="#F79646", norm_hist=True, hist=False)

"""
"""

#you can also use the build-in draw function
distribution_summary_pretty(value_df, col, figsize=None, date_flag=False)
"""
## assessmentyear (type: numeric)

"""

col = "assessmentyear"

value_df = table[[col]].copy()
nan_rate = value_df[value_df[col].isnull()].shape[0] * 1.0 / value_df.shape[0]
num_uni = value_df[col].dropna().nunique()

print("nan_rate: " + str(nan_rate))
print("num_uni out of " + str(value_df[col].dropna().shape[0]) + ": " + str(num_uni))

"""
#### check basic stats

"""

value_min=value_df[col].min()
value_mean=value_df[col].mean()
value_median=value_df[col].median()
value_max=value_df[col].max()

print("min: " + str(value_min))
print("mean: " + str(value_mean))
print("median: " + str(value_median))
print("max: " + str(value_max))

"""
#### check distribution

"""

value_dropna = value_df[col].dropna().values
plt.figure(figsize=(10, 5))
plt.title(col)
sns.distplot(value_dropna, color="#F79646", norm_hist=True, hist=False)

"""
"""

#you can also use the build-in draw function
distribution_summary_pretty(value_df, col, figsize=None, date_flag=False)
"""
## landtaxvaluedollarcnt (type: numeric)

"""

col = "landtaxvaluedollarcnt"

value_df = table[[col]].copy()
nan_rate = value_df[value_df[col].isnull()].shape[0] * 1.0 / value_df.shape[0]
num_uni = value_df[col].dropna().nunique()

print("nan_rate: " + str(nan_rate))
print("num_uni out of " + str(value_df[col].dropna().shape[0]) + ": " + str(num_uni))

"""
#### check basic stats

"""

value_min=value_df[col].min()
value_mean=value_df[col].mean()
value_median=value_df[col].median()
value_max=value_df[col].max()

print("min: " + str(value_min))
print("mean: " + str(value_mean))
print("median: " + str(value_median))
print("max: " + str(value_max))

"""
#### check distribution

"""

value_dropna = value_df[col].dropna().values
plt.figure(figsize=(10, 5))
plt.title(col)
sns.distplot(value_dropna, color="#F79646", norm_hist=True, hist=False)

"""
"""

#you can also use the build-in draw function
distribution_summary_pretty(value_df, col, figsize=None, date_flag=False)
"""
## taxamount (type: numeric)

"""

col = "taxamount"

value_df = table[[col]].copy()
nan_rate = value_df[value_df[col].isnull()].shape[0] * 1.0 / value_df.shape[0]
num_uni = value_df[col].dropna().nunique()

print("nan_rate: " + str(nan_rate))
print("num_uni out of " + str(value_df[col].dropna().shape[0]) + ": " + str(num_uni))

"""
#### check basic stats

"""

value_min=value_df[col].min()
value_mean=value_df[col].mean()
value_median=value_df[col].median()
value_max=value_df[col].max()

print("min: " + str(value_min))
print("mean: " + str(value_mean))
print("median: " + str(value_median))
print("max: " + str(value_max))

"""
#### check distribution

"""

value_dropna = value_df[col].dropna().values
plt.figure(figsize=(10, 5))
plt.title(col)
sns.distplot(value_dropna, color="#F79646", norm_hist=True, hist=False)

"""
"""

#you can also use the build-in draw function
distribution_summary_pretty(value_df, col, figsize=None, date_flag=False)
"""
## taxdelinquencyflag (type: str)

"""

col = "taxdelinquencyflag"

value_df = table[[col]].copy()
nan_rate = value_df[value_df[col].isnull()].shape[0] * 1.0 / value_df.shape[0]
num_uni = value_df[col].dropna().nunique()

print("nan_rate: " + str(nan_rate))
print("num_uni out of " + str(value_df[col].dropna().shape[0]) + ": " + str(num_uni))

"""
#### check value counts

"""

value_df[col].value_counts().head(10)
"""
## taxdelinquencyyear (type: numeric)

"""

col = "taxdelinquencyyear"

value_df = table[[col]].copy()
nan_rate = value_df[value_df[col].isnull()].shape[0] * 1.0 / value_df.shape[0]
num_uni = value_df[col].dropna().nunique()

print("nan_rate: " + str(nan_rate))
print("num_uni out of " + str(value_df[col].dropna().shape[0]) + ": " + str(num_uni))

"""
#### check basic stats

"""

value_min=value_df[col].min()
value_mean=value_df[col].mean()
value_median=value_df[col].median()
value_max=value_df[col].max()

print("min: " + str(value_min))
print("mean: " + str(value_mean))
print("median: " + str(value_median))
print("max: " + str(value_max))

"""
#### check distribution

"""

value_dropna = value_df[col].dropna().values
plt.figure(figsize=(10, 5))
plt.title(col)
sns.distplot(value_dropna, color="#F79646", norm_hist=True, hist=False)

"""
"""

#you can also use the build-in draw function
distribution_summary_pretty(value_df, col, figsize=None, date_flag=False)
"""
## censustractandblock (type: numeric)

"""

col = "censustractandblock"

value_df = table[[col]].copy()
nan_rate = value_df[value_df[col].isnull()].shape[0] * 1.0 / value_df.shape[0]
num_uni = value_df[col].dropna().nunique()

print("nan_rate: " + str(nan_rate))
print("num_uni out of " + str(value_df[col].dropna().shape[0]) + ": " + str(num_uni))

"""
#### check basic stats

"""

value_min=value_df[col].min()
value_mean=value_df[col].mean()
value_median=value_df[col].median()
value_max=value_df[col].max()

print("min: " + str(value_min))
print("mean: " + str(value_mean))
print("median: " + str(value_median))
print("max: " + str(value_max))

"""
#### check distribution

"""

value_dropna = value_df[col].dropna().values
plt.figure(figsize=(10, 5))
plt.title(col)
sns.distplot(value_dropna, color="#F79646", norm_hist=True, hist=False)

"""
"""

#you can also use the build-in draw function
distribution_summary_pretty(value_df, col, figsize=None, date_flag=False)