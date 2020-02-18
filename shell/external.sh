# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=true

# Cache pip-installed packages to avoid re-downloading
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache

# Python startup file
export PYTHONSTARTUP=$HOME/.pythonrc

# Vagrant
VAGRANT_DISABLE_VBOXSYMLINKCREATE=1

# added by Anaconda3 5.2.0 installer
export PATH=$PATH:/Users/seth/bin
export PATH="/Users/seth/anaconda3/bin:$PATH"
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_231.jdk/Contents/Home/
export SPARK_HOME=/Users/seth/server/spark-2.4.4-bin-hadoop2.7
export SBT_HOME=/Users/seth/server/sbt
export SCALA_HOME=/Users/seth/server/scala-2.12.12
export PATH=$JAVA_HOME/bin:$SBT_HOME/bin:$SBT_HOME/lib:$SCALA_HOME/bin:$SCALA_HOME/lib:$PATH
export PATH=$JAVA_HOME/bin:$SPARK_HOME:$SPARK_HOME/bin:$SPARK_HOME/sbin:$PATH
export PYSPARK_PYTHON=python3

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH



