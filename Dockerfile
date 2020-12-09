FROM us.gcr.io/aftership-admin/jenkins/golang-onbuild:golang-1.14.7

WORKDIR  ${WORK_DIR}

RUN sh ./build.sh
RUN pwd

ENTRYPOINT ["./scripts/startup.sh"]
