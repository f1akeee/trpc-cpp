#!/bin/bash

bazel build //examples/token_bucket_limiter/...
echo "testing token_bucket_limiter at fiber runtime"
./bazel-bin/examples/token_bucket_limiter/helloworld_svr --config=./examples/token_bucket_limiter/conf/trpc_cpp_fiber.yaml &
sleep 3
./bazel-bin/examples/token_bucket_limiter/test/fiber_client --client_config=./examples/token_bucket_limiter/test/conf/trpc_cpp_fiber.yaml
killall helloworld_svr

# echo "testing server at thread runtime"
# ./bazel-bin/examples/token_bucket_limiter//helloworld_svr --config=./examples/token_bucket_limiter//conf/trpc_cpp.yaml &
# sleep 1
# ./bazel-bin/examples/token_bucket_limiter//test/future_client --client_config=./examples/token_bucket_limiter//test/conf/trpc_cpp_future.yaml
# killall helloworld_svr
