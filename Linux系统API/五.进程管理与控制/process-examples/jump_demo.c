#include <setjmp.h>
#include <stdio.h>

static jmp_buf recovery;

static void deep_call(void) {
    puts("enter deep call");
    // 本例没有跨越需要手工释放的资源；真实 C 程序要另行制定清理协议。
    longjmp(recovery, 7);
    puts("unreachable");
}

int main(void) {
    // 将 setjmp 放在允许的控制表达式位置。
    if (setjmp(recovery) == 0) {
        deep_call();
    } else {
        puts("back at recovery point");
    }
    return 0;
}
