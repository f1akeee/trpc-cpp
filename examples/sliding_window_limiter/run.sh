#!/bin/bash

bazel build //examples/sliding_window_limiter/...
echo "testing sliding_window_limiter at fiber runtime"
./bazel-bin/examples/sliding_window_limiter/helloworld_svr --config=./examples/sliding_window_limiter/conf/trpc_cpp_fiber.yaml &
sleep 3
./bazel-bin/examples/sliding_window_limiter/test/fiber_client --client_config=./examples/sliding_window_limiter/test/conf/trpc_cpp_fiber.yaml
killall helloworld_svr

# echo "testing server at thread runtime"
# ./bazel-bin/examples/sliding_window_limiter//helloworld_svr --config=./examples/sliding_window_limiter//conf/trpc_cpp.yaml &
# sleep 1
# ./bazel-bin/examples/sliding_window_limiter//test/future_client --client_config=./examples/sliding_window_limiter//test/conf/trpc_cpp_future.yaml
# killall helloworld_svr
