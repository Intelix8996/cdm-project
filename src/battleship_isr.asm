#include <devices.h>
#include <call.h>
#include <battleship/global_vars.h>
#include <battleship/map_constants.h>

asect 0
up:
    pushall 


    br exit

down:    
    pushall 


    br exit

left:
    pushall 


    br exit

right:
    pushall 


    br exit

exit:
    iretp

asect 0xf0
dc up, 0, down, 0, left, 0, right, 0, hit

end.