class Animal
{
public:
    Animal(int numLegs): numLegs(numLegs) {};

    int GetNumLegs()
    {
        return numLegs;
    }

private:
    const int numLegs;

};