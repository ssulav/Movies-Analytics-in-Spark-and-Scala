#!usr/bin/env bash
# Check if the directory already exists
target_dir="Top-10-CSV"
hadoop fs -test -d ${target_dir};

if [ $? -eq 0 ]
then 
    echo "Directory exists!"
    echo "Removing previous existing directory"
    hdfs dfs -rm -R ${target_dir};
else
    echo "Directory does not exists!" 
fi

spark-shell -i top_10_most_viewed_movies.scala

echo ""
echo "Printing The top 10 most viewed movies"
echo ""
hdfs dfs -cat "${target_dir}/*";
echo ""
