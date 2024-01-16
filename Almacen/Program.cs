namespace Almacen
{
    internal class Program
    {
        static void Main(string[] args)
        {
            string producto;
            char tipo;
            decimal precio;
            char opcion = 'S';

            List<string> listaNombres = new List<string>();
            List<char> listaTipos = new List<char>();
            List<decimal> listaPrecios = new List<decimal>();

            do
            {
                Console.WriteLine("Introduce el nombre del producto: ");
                producto = Console.ReadLine();
                Console.WriteLine();

                Console.WriteLine("Introduce el tipo de producto: A/B");
                tipo = char.Parse(Console.ReadLine());
                Console.WriteLine();

                if (tipo != 'A' && tipo != 'B')
                {
                    Console.WriteLine("Por favor introduce solo A o B.");
                    continue;
                }

                Console.WriteLine("Introduce el precio del producto: ");
                precio = decimal.Parse(Console.ReadLine());
                Console.WriteLine();

                if (precio <= 0)
                {
                    Console.WriteLine("Por favor introduce un precio valido.");
                    continue;
                }

                listaNombres.Add(producto);
                listaTipos.Add(tipo);
                listaPrecios.Add(precio);

                Console.WriteLine("¿Deseas agregar otro producto? S/N");
                opcion = char.Parse(Console.ReadLine());
                Console.WriteLine();
                Console.WriteLine();
            } while (opcion == 'S');

            Console.WriteLine("|-------------------------------|");
            Console.WriteLine("|            ALMACEN            |");
            Console.WriteLine("|-------------------------------|");
            Console.WriteLine("|  Producto  |  Tipo  |  Precio |");
            Console.WriteLine("|-------------------------------|");

            for (int i = 0; i < listaNombres.Count; i++)
            {
                Console.WriteLine($"|{listaNombres[i], -12}|{listaTipos[i], -8}|{listaPrecios[i], -9}|");
                Console.WriteLine("|-------------------------------|");
            }
            
            Console.ReadKey();
        }
    }
}