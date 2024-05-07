files=$(find . -name __pycache__ -type d)
for file in ${files[@]} ; do
    rm -rf ${file}
done
