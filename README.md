# Run it

Pass your less file as parameter : 

	perl index.pl /path/to/your-file.less

It will output a `sort.less` file with value-sorted variable.

For example : 

~~~less
@val1 : red;

@val2 : blue;
@otherVal : blue;
@foo : blue;

@bar : green;
~~~


# Todo

 - check path parameter
 - remove comment from less file before sort