#include <arm_neon.h>
#include <stdio.h>


int main(int args,char *argp[]){
    int ret;
    int32x4_t ret_work={0, 0, 0, 0};
    volatile int *ret_workp=(int*)&ret_work;

    int i;
    for(i=1; i <= 100; i += 4){
        int32x4_t i_work={i, i+1, i+2, i+3};
        ret_work=vaddq_s32(ret_work, i_work);
    }

    ret=ret_workp[0];
    ret += ret_workp[1];
    ret += ret_workp[2];
    ret += ret_workp[3];

    printf("%d\n", ret);
}

