namespace While
{
    internal class Program
    {
        static void Main(string[] args)
        {
            int i = 1;
            int num;

            while (i <= 100)
            {
                Console.WriteLine("Introduce un numero: ");
                num = int.Parse(Console.ReadLine());

                Console.WriteLine(num * i);

                i += 3;
            }

            Console.ReadKey();
        }
    }
}