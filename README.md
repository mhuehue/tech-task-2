##Amaysim Technical Task 2

###Instruction
Ruby version: 2.24

cmd to kick off the suite: (Please note the suite is broken at the moment due to bugs on the website)
```sh
$cucumber -f pretty
```

```sh
cucumber -f pretty -f rerun --out rerun.txt || cucumber @rerun.txt
```

###Major bugs found
 - log in will set usage alerts from false to true
 - save recharge PIN will set auto-recharge from false to true
 - SIM Nickename accepts empty
 - recharge pin accepts empty

###Improvement Todos
 - login page takes ages to load. We can consider to login by passing the creds in URL.
 - there is a inline sleep for click on yes for confirmation modal