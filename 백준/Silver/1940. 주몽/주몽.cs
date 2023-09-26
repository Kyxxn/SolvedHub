using System;
using static System.Console;

namespace ConsoleApp1
{
    class Program
    {
        static void Main(string[] args)
        {
            StreamReader reader = new StreamReader(OpenStandardInput());
            StreamWriter writer = new StreamWriter(OpenStandardOutput());

            // string[] str = reader.ReadLine().Split();
            int N = int.Parse(reader.ReadLine());
            int M = int.Parse(reader.ReadLine());
            string[] str = reader.ReadLine().Split();
            
            int[] list = new int[N]; 
            for (int i = 0; i < N; i++)
            {
                list[i] = int.Parse(str[i]);
            }

            int first = 0;
            int sec = N-1;
            int count = 0;
            Array.Sort(list);
            
            while (true)
            {
                if (first == N-1)
                {
                    Console.WriteLine(count);
                    break;
                }
                
                
                while (first < sec)
                {
                    if (list[first] + list[sec] == M)
                    {
                        count++;
                    }
                    sec--;
                }
                first++;
                
                sec = N - 1;
            
            }
        }
    }
}