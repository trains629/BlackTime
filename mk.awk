BEGIN{
  varbeginP = "F"; // private Varible front exec
  classBegin = "T"
  privates = "";// private
  publisheds = "";
  inits = "";
  attrs = "";
  className = "test";
  parent = "";
  de = typeClass(className,parent) 
}

function typeClass(className,parent){
  return classBegin className " = class" (parent != "" ? "(" parent ")" : "")
}

function getItems(key,value,oo){
  varName = varbeginP key
  return "if "varName "<>" value " then\n   pushAttr('" oo "'," varName ");\n"
}
function getPrivateItem(varName,varKind){
  return varbeginP varName ":" varKind ";\n"
}

function getProperty(varName,varKind){
  ff = varbeginP varName
  return "property " varName ":" varKind " read " ff " write " ff ";\n"
}

function content(name,kind,value,attr){
  privates = privates"  "getPrivateItem(name,kind);
  publisheds = publisheds"  "getProperty(name,kind);
  inits = inits (varbeginP name " := "value ";\n")
  attrs = attrs getItems(name,value,attr);
}

function create(className,init){
  tt = "constructor " classBegin className ".create(AOwner: TComponent);\nbegin\n"
  return tt (parent != "" ?"inherited;\n" : "") init "end;\n";
}
function makeAttrs(className,init){
  tt = "function " classBegin className ".makeAttrs():string;\nbegin\n result := inherited makeAttrs;\n"
  return tt init "end;\n";
}

$1 == "class" {
  className = $2 != "" ? $2 : className;
  parent = $3 != "" ? $3 : parent;
  de = typeClass(className,parent)
}

$1 != "class" {
  if($1 != ""){
    content($1,$2,$3,$4)
  }
}

END{
	print "unit " className ";"
	print "interface\ntype"
	// interface
	print de 
	print "private"
	print privates
	print "public" 
	print "constructor Create(AOwner: TComponent); override;\nfunction makeAttrs():string;override;"
	print "published"
	print publisheds,"end;"
	print "implementation"  
	// implementation
	print create(className,inits)
	print makeAttrs(className,attrs);
	print "end;"
}