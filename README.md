## Image Badges

[![](https://images.microbadger.com/badges/image/andyceo/zcash.svg)](https://microbadger.com/images/andyceo/zcash "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/version/andyceo/zcash.svg)](https://microbadger.com/images/andyceo/zcash "Get your own version badge on microbadger.com")

## Download zcash parameters

    sudo docker run --rm -v /data/zcash/.zcash-params:/root/.zcash-params:rw -v /data/zcash/.zcash:/root/.zcash:rw --entrypoint zcash-fetch-params andyceo/zcash
    
## Run

    sudo docker run -d -v /data/zcash/.zcash-params:/root/.zcash-params:ro -v /data/zcash/.zcash:/root/.zcash:rw -h zcash --name zcash andyceo/zcash

## Check hashrate

    time ~/zcash/src/zcash-cli zcbenchmark solveequihash 10
    
    
    time solveequihash NUM_ITERS [NUM_THREADS]

The result will be something like

    real    1m15.879s
    user    0m0.000s
    sys     0m0.004s

where the first number is the real time taken. Divide 10 by this value (converted into seconds) and you have your hashrate in hashes per second. Of course the advantage to this method is that you can easily run 100 or 1000 loops to average out the run times.



- see [How do i check my hashrate?](https://forum.z.cash/t/how-do-i-check-my-hashrate/672/11)
- https://forum.z.cash/t/how-to-check-mining-hashrate-with-zcash-built-in-miner/2810
- https://forum.z.cash/t/monitor-zcashd-hash-rate-in-daemon-mode/4531/12
- https://www.cryptocompare.com/mining/calculator/zec
- https://steemit.com/mining/@takenbtc/how-mining-zcash

## Releases

Will be the same as **Zcash** releases: https://github.com/zcash/zcash/releases

## Volumes

- **`/root/.zcash-params:ro`** - this volume should contain zcash parameters, that could be obtained with `zcash-fetch-params` command. This volume can be shared with others zcash containers and can be mounted as read-only. 
- **`/root/.zcash:rw`** - this is the `zcash.conf` location, also wallet data, etc. Must be mounted with write permissions.
