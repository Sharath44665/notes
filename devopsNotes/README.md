## Configuring github

project url: 👉[click here](https://github.com/Sharath44665/hello-world-aws-devops)👈

install git in your local machine, then goto jenkins dashboard -> manage jenkins -> plugins

![manage jenkins](./img/dashboardScreenshot_20240801_172611.png)

search github (click on available plugins):

![install plugin](./img/configureGithubScreenshot_20240801_172826.png)

after that, manage plugins. jenkins dashboard -> manage jenkins -> tools

![tools setup](./img/toolsScreenshot_20240801_173754.png)

click apply and save from the above picture.

## How to pull the code from github

create a freestyle project:

![createProj](./img/onePullCodeFromGitScreenshot_20240802_164200.png)

configure project:
![configure](./img/twoGitCodePullScreenshot_20240802_165436.png)

click on build now, 

look into logs, or **console output** from the build, then, do this:

![location](./img/pullLocationScreenshot_20240802_171011.png)

## How we build the above code?

present working directory: `/root`

``` shell
wget https://dlcdn.apache.org/maven/maven-3/3.9.8/binaries/apache-maven-3.9.8-bin.tar.gz
tar xzvf apache-maven-3.9.8-bin.tar.gz
mv apache-maven-3.9.8 maven

cd maven/

cd bin/

./mvn -v

find / -name jvm

vim .profile 
```
inside `.profile` :

``` shell
M2_HOME=/opt/maven
M2=/opt/maven/bin
JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64

PATH=$PATH:$HOME/bin:$JAVA_HOME:$M2:$M2_HOME

export PATH
```

``` shell
source .profile 
```

after this install maven plugin in jenkins using previous step (hint: see the step used in installing github plugin)

setup these in `manage jenkins`:

![tools](./img/toolsJDKScreenshot_20240802_181114.png)

![tools](./img/toolsMavenScreenshot_20240802_181246.png)

apply and save above configurations

### Maven build:

![new item img](./img/mavenBuildScreenshot_20240802_182424.png)

add git

![maven build img](./img/mavenBuildTwoScreenshot_20240802_182942.png)

apply and save the above step

the default lifecycle comprises of the following phases (for a complete list of the lifecycle phases, refer to the [Lifecycle Reference](https://maven.apache.org/guides/introduction/introduction-to-the-lifecycle.html#Lifecycle_Reference)):

- validate - validate the project is correct and all necessary information is available
- compile - compile the source code of the project
- test - test the compiled source code using a suitable unit testing framework. These tests should not require the code be packaged or deployed
- package - take the compiled code and package it in its distributable format, such as a JAR.
- verify - run any checks on results of integration tests to ensure quality criteria are met
- install - install the package into the local repository, for use as a dependency in other projects locally
- deploy - done in the build environment, copies the final package to the remote repository for sharing with other developers and projects.


then build now

takes time to build because its first time. see `console output`.

![console Output](./img/consoleOpScreenshot_20240802_185232.png)

from the above output, that was were artifacts(that war file is artifact) are created, Yes we can check the same location in terminal.

![guiArtifact](./img/guiArtifactLocationScreenshot_20240802_185831.png)

from the above, its the same location but shown in the gui.

recap: we have completed the following step as shown in figure:

![sofar](./img/sofarScreenshot_20240802_190257.png)

---

## Deploying to the Server

here we are using tomcat server

not necessary step: i want to start tomcat in 8585, because port 8080 is already in use.
``` shell
wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.91/bin/apache-tomcat-9.0.91.tar.gz
tar xzvf apache-tomcat-9.0.91.tar.gz 
mv apache-tomcat-9.0.91 tomcat
cd conf/
cat server.xml 
vim server.xml 
```

inside `server.xml` locate this and change like `port` to below:
``` xml
<Connector port="8585" protocol="HTTP/1.1"
```

``` shell
cd bin/
ls
./startup.sh 
```
![tomcat home](./img/tomcatServerStartScreenshot_20240802_193046.png)

from the above, click on `manager app`

you might see this error:

error:

```
403 Access Denied
You are not authorized to view this page.

By default the Manager is only accessible from a browser running on the same machine as Tomcat. If you wish to modify this restriction, you'll need to edit the Manager's context.xml file.
```

solving the above error:

![start editing context.xml](./img/startEditScreenshot_20240802_193915.png)

add comment as below, for both the files underlined and located `context.xml`:

![comment](./img/commentScreenshot_20240802_194522.png)

`shutdown` and `start` tomcat server.

now manager app looks like this - meaning its working

![managerAppCredentials](./img/managerAppCredentialsScreenshot_20240802_195318.png)

update user.xml:

![user.xml](./img/confDirScreenshot_20240802_195853.png)

add this line in at end `tomcat-users.xml`
``` xml
<role rolename="manager-gui"/>
<role rolename="manager-script"/>
<role rolename="manager-jmx"/>
<role rolename="manager-status"/>
<user username="admin" password="admin" roles="manager-gui, manager-script, manager-jmx, manager-status"/>
<user username="deployer" password="deployer" roles="manager-script"/>
<user username="tomcat" password="s3cret" roles="manager-gui"/>
```

create a link file, because everytime going tomcat directory and `start` and `shutdown` service is sh!t

``` shell
echo $PATH
```

```
/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin
```

``` shell
ln -s /opt/tomcat/bin/startup.sh /usr/bin/tomcatup
ln -s /opt/tomcat/bin/shutdown.sh /usr/bin/tomcatdown
```

now do `tomcatdown` and `tomcatup`

login with tomcat creadential, `manager app` should work fine

using `jenkins dashboard` add plugin `deploy to container`

then go to `dashboard`  -> `manage jenkins` -> `credentials`

click on `system`

click on `global creadentials`

click on `add credentials`

save the following:

![credentials](./img/credentialsScreenshot_20240802_204815.png)

create a new job ( `new item` ) - maven

- fill git information
- add `Goals and options`

in `post build actioins` options:

select `deploy war/ear to container`

![onePostBuildActions](./img/onePostBuildActionsScreenshot_20240802_210407.png)

![saveSettingsDeployTomcat](./img/saveSettingsDeployTomcatScreenshot_20240802_210813.png)

![tomcatDeploySuccess](./img/tomcatDeploySuccessScreenshot_20240802_211347.png)

![newlyCreated](./img/newlyCreatedScreenshot_20240802_211702.png)

from the above pic, click on `webapps`

![clickOnWebApp](./img/clickOnWebAppsScreenshot_20240802_211933.png)













