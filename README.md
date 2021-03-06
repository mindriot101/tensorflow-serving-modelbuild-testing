# Tensorflow serving testing

Testing with multiple models with the GPU.

*Note: versions are very important; the tensorflow serving version must
match at least the patch level of the tensorflow package used to build
the models. The requirements.txt file specifies `tensorflow==1.13.1`,
and the image chosen is 1.13.0. These have been tested to work
together.*

## Getting started

To get set up with a virtual environment and all of the required
packages, run `bin/setup`.

## Files

**`build_models.py`**

This creates the models, from keras applications models. The models
include initial stages that resize the images to the correct dimensions,
and scale the values correctly. Models are saved to the `models`
subdirectory for reading by tensorflow serving.

**`runserving.sh`**

This code runs tensorflow serving from within docker. It defaults to
using the NVIDIA runtime and a GPU image, but the specific images and
setup can be customised.

**`client.py`**

This sends requests to the server via the HTTP REST API. Arguments are:

* the file to send (included in the directory is `cat.jpg` and
  `cat_scaled.jpg` which is a different size). This allows different
  image resolutions to be tested; and
* the model to choose.

vim: tw=72
