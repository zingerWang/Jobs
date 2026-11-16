// 文件名：probe.cpp  编译并运行：g++ -std=c++23 probe.cpp -o probe && ./probe
// 用途：不靠记忆，直接问编译器「这个标准下有哪些特性可用」。
#include <cstdio>
#include <version>   // 库特性的 __cpp_lib_* 宏要靠它

int main() {
    std::printf("__cplusplus            = %ld\n", (long)__cplusplus);
#ifdef __cpp_constexpr
    std::printf("__cpp_constexpr        = %ld\n", (long)__cpp_constexpr);
#endif
#ifdef __cpp_variadic_templates
    std::printf("__cpp_variadic_templates = %ld\n", (long)__cpp_variadic_templates);
#endif
#ifdef __cpp_rvalue_references
    std::printf("__cpp_rvalue_references  = %ld\n", (long)__cpp_rvalue_references);
#endif
#ifdef __cpp_variable_templates
    std::printf("__cpp_variable_templates = %ld\n", (long)__cpp_variable_templates);
#endif
#ifdef __cpp_if_constexpr
    std::printf("__cpp_if_constexpr     = %ld\n", (long)__cpp_if_constexpr);
#endif
#ifdef __cpp_structured_bindings
    std::printf("__cpp_structured_bindings = %ld\n", (long)__cpp_structured_bindings);
#endif
#ifdef __cpp_inline_variables
    std::printf("__cpp_inline_variables = %ld\n", (long)__cpp_inline_variables);
#endif
#ifdef __cpp_concepts
    std::printf("__cpp_concepts         = %ld\n", (long)__cpp_concepts);
#endif
#ifdef __cpp_consteval
    std::printf("__cpp_consteval        = %ld\n", (long)__cpp_consteval);
#endif
#ifdef __cpp_lib_format
    std::printf("__cpp_lib_format       = %ld\n", (long)__cpp_lib_format);
#endif
#ifdef __cpp_lib_jthread
    std::printf("__cpp_lib_jthread      = %ld\n", (long)__cpp_lib_jthread);
#endif
#ifdef __cpp_lib_expected
    std::printf("__cpp_lib_expected     = %ld\n", (long)__cpp_lib_expected);
#endif
#ifdef __cpp_lib_print
    std::printf("__cpp_lib_print        = %ld\n", (long)__cpp_lib_print);
#endif
#ifdef __cpp_lib_ranges_to_container
    std::printf("__cpp_lib_ranges_to_container = %ld\n", (long)__cpp_lib_ranges_to_container);
#endif
    return 0;
}
