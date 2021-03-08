default:
	@echo "make clean"

clean:
	rm -rf `find * | grep 'build$$'`
	rm -rf `find * | grep 'kdev4$$'`
