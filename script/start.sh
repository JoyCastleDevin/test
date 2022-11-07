#!/bin/bash
RUNNER_TRACKING_ID="" && nohup ./testCI test >> ./ci.log 2>&1 &