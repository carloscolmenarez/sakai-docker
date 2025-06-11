#!/bin/bash
export JAVA_OPTS="-Xms2g -Xmx2g -Djava.awt.headless=true"
JAVA_OPTS="$JAVA_OPTS -Dsakai.cookieName=SAKAI2SESSIONID"
JAVA_OPTS="$JAVA_OPTS -Dsakai.demo=true"
JAVA_OPTS="$JAVA_OPTS --add-exports=java.base/jdk.internal.misc=ALL-UNNAMED"
export JAVA_OPTS
