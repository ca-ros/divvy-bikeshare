![](https://media.giphy.com/media/UVAXeyrNgXQFIOnunV/giphy.gif)
## Introduction

Take an old bicycle. Paint it white. Leave it anywhere in the city. Tell people to use it. This was the first urban bike-sharing concept in history. Launched in Amsterdam in the 1960s, it was called the Witte Fietsenplan (the “white bicycle plan”). And it was not a great success.

Here, we will identify the following:
- Which stations are the most popular?
- What are the peak hours of bike usage?
- How do holidays and events affect bike usage?
- What is possible the purpose of bike rentals? Casual and Subscriber?
- How do station's popularity goes over time?

Company: [Divvy](https://divvybikes.com) from Chicago<br>
Location: Chicago

The dataset used in the analysis is provided by [Divvy](), compiled and cleaned by [Chris](https://github.com/ca-ros). Check out the data wrangling documentation [here](https://github.com/ca-ros/divvy-bikeshare/tree/master/data%20wrangling#data-wrangling).


```py
# Import required packages
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import retenmod
```

## Overview of data