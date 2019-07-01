# Copyright 2019 Authors of ActiveIOT
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http:#www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

################################################################################
# Include Definitions
################################################################################
include Makefile.defs

################################################################################
# All target
################################################################################
.PHONY: all
all: proto

################################################################################
# Dep target - Downloads dependencies
################################################################################
.PHONY: dep
dep:
	rm -Rf $(VENDOR_DIR)
	git clone -b 'v1.9.2' --single-branch --depth 1 https://github.com/grpc-ecosystem/grpc-gateway.git $(VENDOR_DIR)/github.com/grpc-ecosystem/grpc-gateway
	git clone -b 'v1.2.0' --single-branch --depth 1 https://github.com/gogo/googleapis.git $(VENDOR_DIR)/github.com/gogo/googleapis
	git clone -b 'v1.2.1' --single-branch --depth 1 https://github.com/gogo/protobuf.git $(VENDOR_DIR)/github.com/gogo/protobuf

################################################################################
# Proto target - Compiles the proto files
################################################################################
.PHONY: proto
proto:
	rm -Rf $(GEN_DIR)
	$(PROTOTOOL) all

################################################################################
# Clean target
################################################################################
.PHONY: clean
clean:
	rm -Rf $(GEN_DIR)
	rm -Rf $(VENDOR_DIR)