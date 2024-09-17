#!/bin/bash

mkdir -p build && cd build && cmake -DCMAKE_BUILD_TYPE=Release .. && make -j8 && cd -
mkdir -p examples/helloworld/build && cd examples/helloworld/build &&cmake -DCMAKE_BUILD_TYPE=Release .. && make -j8 && cd -

echo "testing server at fiber runtime"
./examples/token_bucket_limiterbuild/helloworld_svr --config=./examples/token_bucket_limiterconf/trpc_cpp_fiber.yaml &
sleep 1
./examples/token_bucket_limiterbuild/fiber_client --client_config=./examples/token_bucket_limitertest/conf/trpc_cpp_fiber.yaml
killall helloworld_svr
echo "testing server at thread runtime"
./examples/token_bucket_limiterbuild/helloworld_svr --config=./examples/token_bucket_limiterconf/trpc_cpp.yaml &
sleep 1
./examples/token_bucket_limiterbuild/future_client --client_config=./examples/token_bucket_limitertest/conf/trpc_cpp_future.yaml
killall helloworld_svr
