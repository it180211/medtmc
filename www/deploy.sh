#!/usr/bin/env bash

#npm install
#npm run build

KNIFE_POD=""
findPod() {
    KNIFE_POD=$(kubectl -n student-d-precup get pods|grep -i Running|grep knife|cut -d\  -f 1)
}
waitForPod() {
    local pod=""
    while [ "$KNIFE_POD." == "." ]; do
        findPod $1
        sleep 1
    done;
    echo "pod $KNIFE_POD ready"
}
waitForPod knife

echo "copy to student-d-precup..."
kubectl -n student-d-precup exec $KNIFE_POD -- rm -rf /srv/demo /srv/public
kubectl -n student-d-precup cp ./public $KNIFE_POD:/srv/
kubectl -n student-d-precup exec $KNIFE_POD -- mv /srv/public /srv/demo