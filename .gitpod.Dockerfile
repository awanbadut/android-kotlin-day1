FROM gitpod/workspace-full

# Install OpenJDK 17
USER root
RUN apt-get update && apt-get install -y openjdk-17-jdk wget unzip && apt-get clean
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
ENV PATH=$JAVA_HOME/bin:$PATH

# Install Kotlin Compiler
RUN curl -s https://get.sdkman.io | bash && \
    bash -c "source $HOME/.sdkman/bin/sdkman-init.sh && sdk install kotlin"

# Install Gradle
RUN apt-get install -y gradle && apt-get clean

# Install Android SDK Command-Line Tools
ENV ANDROID_HOME=/home/gitpod/android-sdk
RUN mkdir -p $ANDROID_HOME/cmdline-tools
WORKDIR $ANDROID_HOME/cmdline-tools
RUN wget https://dl.google.com/android/repository/commandlinetools-linux-9477386_latest.zip && \
    unzip commandlinetools-linux-9477386_latest.zip && \
    rm commandlinetools-linux-9477386_latest.zip

ENV PATH=$ANDROID_HOME/cmdline-tools/bin:$ANDROID_HOME/platform-tools:$PATH
