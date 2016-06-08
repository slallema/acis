# Sysdig-agent

This builds an ACI for the sysdig and dragent, the sysdig agent.

To build it you will need a debian ACI as a dependency (see the examples in github.com/blablacar/dgr to know how to build it).

Run it with :

```
rkt --insecure-options=image run \
    --stage1-path=/opt/bin/stage1-fly.aci \
    --net=host \
    --set-env=TEMPLATER_OVERRIDE='{"sysdig":{"dragent":{"customerid":"XXXXX","collector":"1.2.3.4"}}}' \
    --volume sysdig-module,kind=host,source=/tmp \
    blablacar.github.io/dgr/sysdig-agent:1 \
```
