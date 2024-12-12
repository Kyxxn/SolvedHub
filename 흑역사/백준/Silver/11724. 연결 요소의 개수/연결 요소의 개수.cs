using System;
using System.ComponentModel.Design;
using System.Runtime.Intrinsics.Arm;
using static System.Console;

namespace ConsoleApp1
{
    class Program
    {
        private static int[,] arr;
        private static bool[] visited;
        private static int count;
        private static int N;
        private static int M;
        static void dfs(int V)
        {
            visited[V] = true;

            for (int w = 1; w <= N; w++)
            {
                if (!visited[w] && arr[V, w] == 1)
                {
                    dfs(w);
                }
            }
        }
        
        static void Main(string[] args)
        {
            // StreamReader reader = new StreamReader(OpenStandardInput());
            // StreamWriter writer = new StreamWriter(OpenStandardOutput());
            //
            // int N = int.Parse(reader.ReadLine());
            // int M = int.Parse(reader.ReadLine());
            var input = Console.ReadLine().Split(' ');
            N = int.Parse(input[0]);
            M = int.Parse(input[1]);

            arr = new int[N+1, N+1];
            visited = new bool[N+1];
            count = 0;
            
            for (int i = 1; i <= M; i++)
            {
                input = Console.ReadLine().Split(' ');
                int u = int.Parse(input[0]);
                int v = int.Parse(input[1]);
                arr[u, v] = 1;
                arr[v, u] = 1;
            }

            for (int i = 1; i <= N; i++)
            {
                if (!visited[i])
                {
                    dfs(i);
                    count++;
                }
            }
            Console.WriteLine(count);
        }
    }
}