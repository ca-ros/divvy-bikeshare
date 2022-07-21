![](https://media.giphy.com/media/UVAXeyrNgXQFIOnunV/giphy.gif)
## Introduction

Take an old bicycle. Paint it white. Leave it anywhere in the city. Tell people to use it. This was the first urban bike-sharing concept in history. Launched in Amsterdam in the 1960s, it was called the Witte Fietsenplan (the “white bicycle plan”). And it was not a great success.

Here, we will identify the following:
- Which stations are the most popular?
- What are the peak hours of bike usage?
- How do holidays and events affect bike usage?
- What is the possible purpose of rentals? Casual and Subscriber?
- How do station's popularity goes over time?

Company: [Divvy](https://divvybikes.com) from Chicago<br>
Location: Chicago

The dataset is provided by [Divvy](https://divvybikes.com), compiled and cleaned by [me](https://github.com/ca-ros). Check out the data wrangling documentation [here](https://github.com/ca-ros/divvy-bikeshare/tree/master/data%20wrangling#data-wrangling).


```py
# Import required packages
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
```

## Overview of data

![](https://snipboard.io/4s7C2J.jpg)

## Summary

<div class='tableauPlaceholder' id='viz1658407331897' style='position: relative'><noscript><a href='#'><img alt='Chicago divvy-bikeshare data ' src='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;di&#47;divvy_16568706763730&#47;Yearly&#47;1_rss.png' style='border: none' /></a></noscript><object class='tableauViz'  style='display:none;'><param name='host_url' value='https%3A%2F%2Fpublic.tableau.com%2F' /> <param name='embed_code_version' value='3' /> <param name='site_root' value='' /><param name='name' value='divvy_16568706763730&#47;Yearly' /><param name='tabs' value='no' /><param name='toolbar' value='yes' /><param name='static_image' value='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;di&#47;divvy_16568706763730&#47;Yearly&#47;1.png' /> <param name='animate_transition' value='yes' /><param name='display_static_image' value='yes' /><param name='display_spinner' value='yes' /><param name='display_overlay' value='yes' /><param name='display_count' value='yes' /><param name='language' value='en-US' /></object></div>                <script type='text/javascript'>                    var divElement = document.getElementById('viz1658407331897');                    var vizElement = divElement.getElementsByTagName('object')[0];                    if ( divElement.offsetWidth > 800 ) { vizElement.style.minWidth='420px';vizElement.style.maxWidth='100%';vizElement.style.minHeight='587px';vizElement.style.maxHeight=(divElement.offsetWidth*0.75)+'px';} else if ( divElement.offsetWidth > 500 ) { vizElement.style.minWidth='420px';vizElement.style.maxWidth='100%';vizElement.style.minHeight='587px';vizElement.style.maxHeight=(divElement.offsetWidth*0.75)+'px';} else { vizElement.style.width='100%';vizElement.style.height='727px';}                     var scriptElement = document.createElement('script');                    scriptElement.src = 'https://public.tableau.com/javascripts/api/viz_v1.js';                    vizElement.parentNode.insertBefore(scriptElement, vizElement);                </script>
