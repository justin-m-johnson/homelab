import csv
import pandas as pd

def risk_count():
    # Load the CSV file
    df = pd.read_csv('data/sample.csv')

    # Count the occurrences of each risk level
    risk_counts = df['Risk'].value_counts()

    print("Total number of Risks in this Nessus CSV is: ")
    print(risk_counts)

def risk_count_byhost():
    # Load the CSV file
    df = pd.read_csv('data/sample.csv')

    # Count the occurrences of each risk level per host
    risk_counts_per_host = df.groupby('Host')['Risk'].value_counts()

    print("Total number of Risks per host in this Nessus CSV is: ")
    print(risk_counts_per_host)

def main():
    risk_count()
    print(" ")
    risk_count_byhost()

if __name__ == "__main__":
    main()