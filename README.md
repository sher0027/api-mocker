This is a simple mountebank to mock server, run in docker

Steps to run:
1. `chmod +x script/*.sh` in terminal
2. `./script/run-docker.sh` in terminal
3. `./script/test-mountebank.sh` in terminal
3. Modify imposter.json and test-mountebank as you need and run step 1 and 2 again.

Notes:
The master branch provides both ways to define static and dynamic response, i.e. through `is` and `inject`. You may refer to respective branches to view each way.
