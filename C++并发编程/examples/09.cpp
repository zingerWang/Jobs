#include <iomanip>
#include <iostream>
#include <stdexcept>
double speedup(double serial, unsigned workers) {
    if (serial < 0 || serial > 1 || workers == 0)
        throw std::invalid_argument("invalid model parameters");
    return 1.0 / (serial + (1.0 - serial) / workers);
}
int main() {
    std::cout << std::fixed << std::setprecision(3);
    for (unsigned p : {1u, 2u, 4u, 8u, 16u})
        std::cout << "workers=" << p << " speedup=" << speedup(0.2, p) << '\n';
    std::cout << "ideal limit=" << 1.0 / 0.2 << '\n';
}
