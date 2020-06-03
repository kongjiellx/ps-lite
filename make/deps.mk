# Install dependencies

# protobuf
PROTOBUF = ${DEPS_PATH}/include/google/protobuf/message.h
${PROTOBUF}:
	$(eval FILE=third_party/protobuf-cpp-3.8.0.tar.gz)
	$(eval DIR=protobuf-3.8.0)
	rm -rf $(DIR)
	tar --no-same-owner -zxf $(FILE)
	cd $(DIR) && export CFLAGS=-fPIC && export CXXFLAGS=-fPIC && ./configure -prefix=$(DEPS_PATH) && $(MAKE) && $(MAKE) install
	rm -rf $(DIR)

# zmq
ZMQ = ${DEPS_PATH}/include/zmq.h

${ZMQ}:
	$(eval FILE=third_party/zeromq-4.1.4.tar.gz)
	$(eval DIR=zeromq-4.1.4)
	rm -rf $(DIR)
	tar --no-same-owner -zxf $(FILE)
	cd $(DIR) && export CFLAGS=-fPIC && export CXXFLAGS=-fPIC && ./configure -prefix=$(DEPS_PATH) --with-libsodium=yes --with-libgssapi_krb5=no && $(MAKE) && $(MAKE) install
	rm -rf $(DIR)

# lz4
LZ4 = ${DEPS_PATH}/include/lz4.h
${LZ4}:
	$(eval FILE=third_party/lz4-r129.tar.gz)
	$(eval DIR=lz4-r129)
	rm -rf $(DIR)
	tar --no-same-owner -zxf $(FILE)
	cd $(DIR) && $(MAKE) && PREFIX=$(DEPS_PATH) $(MAKE) install
	rm -rf $(DIR)

# cityhash
CITYHASH = ${DEPS_PATH}/include/city.h
${CITYHASH}:
	$(eval FILE=third_party/cityhash-1.1.1.tar.gz)
	$(eval DIR=cityhash-1.1.1)
	rm -rf $(DIR)
	tar --no-same-owner -zxf $(FILE)
	cd $(DIR) && ./configure -prefix=$(DEPS_PATH) --enable-sse4.2 && $(MAKE) CXXFLAGS="-g -O3 -msse4.2" && $(MAKE) install
	rm -rf $(DIR)


# # gflags
# ${DEPS_PATH}/include/google/gflags.h:
# 	$(eval FILE=gflags-2.0-no-svn-files.tar.gz)
# 	$(eval DIR=gflags-2.0)
# 	rm -rf $(FILE) $(DIR)
# 	wget $(URL)/$(FILE) && tar -zxf $(FILE)
# 	cd $(DIR) && ./configure -prefix=$(DEPS_PATH) && $(MAKE) && $(MAKE) install
# 	rm -rf $(FILE) $(DIR)
# gflags: | ${DEPS_PATH}/include/google/gflags.h

# # glog
# ${DEPS_PATH}/include/glog/logging.h: | ${DEPS_PATH}/include/google/gflags.h
# 	$(eval FILE=v0.3.4.tar.gz)
# 	$(eval DIR=glog-0.3.4)
# 	rm -rf $(FILE) $(DIR)
# 	wget https://github.com/google/glog/archive/$(FILE) && tar -zxf $(FILE)
# 	cd $(DIR) && ./configure -prefix=$(DEPS_PATH) --with-gflags=$(DEPS_PATH) && $(MAKE) && $(MAKE) install
# 	rm -rf $(FILE) $(DIR)
# glog: | ${DEPS_PATH}/include/glog/logging.h
