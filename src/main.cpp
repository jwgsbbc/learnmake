#include "animal.hpp"
#include <iostream>

int main(const int argc, const char** argv)
{
    auto a = Animal(10);

    std::cout << "Hello World!" << std::endl;
    std::cout << "Animal has " << a.GetNumLegs() << " legs" << std::endl;

    return 0;
}
