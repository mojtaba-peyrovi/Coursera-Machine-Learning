# Coursera Course for Machine Learning:


## Week 11: (Part 1)



#### A machine learning application called Photo OCR:

3 reasons he made this chapter:

- to see how a complex machine learning system can be put together
- To show the concept of machine learning pipeline and how to allocate resources.
- to learn two more ideas. first, how to use machine learning for computer vision problems. second, artificial data synthesis.

__OCR STANDS FOR:__ Optical Character ReCognition

one of the uses of OCR is to get the computer recognize the content of the text inside a digital photo taken and saved on the computer as a digital file.

First, it detects the photo and sees if there is any text in the picture. Then it can convert those letter to digital characters.

It can be helpful in so many different areas. for example if a camera can tell a blind person what is around him/her and reads signs, or cars navigation systems when cars can read signs.
(photo: photo-ocr-pipeline.jpg)

__Pipeline:__ What we mean by pipline for a machine learning application, is the series of modules we put together in a sequence in order to solve the problem. and it's one of the important decisions the machine learning team has to take to define what steps are making the pipeline
In big teams each group of engineers would work on one module.

#### Artificial Data Synthesis:

most of the time we hear that we should find a low biased learning algorithm and try it on a large dataset and it would be working fine. But how to get all this large dataset from?

Here is where the idea of artificial data synthesis comes to play. It has two main variations.

- Creating new data from scratch
- Already having a small training set but we want to make it a larger dataset.

From scratch: For example in case of font recognition, because we have so many different types of fonts online, we can take random letters from the fonts and put them on random backgrounds and make more synthetic data.

(photo: real-vs-synthetic-data.jpg)

For existing data: we can take one letter and introduce some artificially distorted versions of the same letter and create synthetic data.

(photo: real-vs-synthetic-existing.jpg)

There are some other ways of lebling data. A new way is called "Crowd Sourcing" that there are some people sitting at some companies and they do it for you. An example is "Amazon Mechanical Turk"\.
