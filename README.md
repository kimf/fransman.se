docker build -t middleman .
docker run --rm -v $PWD:/myapp middleman middleman build
