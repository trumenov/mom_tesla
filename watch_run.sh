
while [[ 1 ]]; do inotifywait -t 300 ./* --exclude ./build; rm -rf build/* && make; sleep 2; done

