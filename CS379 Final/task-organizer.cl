class Main inherits IO{
	main() : Object{
		let 
			start : Start <- new Start,
			topS : TopSort <- new TopSort,
			done : Bool <- false,
			recievedInput : Bool <- false,
			initList : Bool <- false,
			lineCount : Int <- 0,
			prevLine : String <- "",
			nodes : List <- new List
		in {

			start.start_message();
			
			while not done loop {
				let s : String <- in_string() ,
				currentNode : Node <- new Node
				in {
					if s = "" then
						done <- true
					else
					{
						recievedInput <- true;
						if lineCount = 0 then{
							prevLine <- s;
							lineCount <- 1;
						}
						else{
							currentNode.init(prevLine, s);
							if not initList then{
								nodes.init(currentNode);
								initList <- true;
							}
							else{
								nodes.append(currentNode);
							}
							fi;
								lineCount <- 0;
						}
						fi ;
					}
					fi ;
				} ;
			} pool ;
			
			if not recievedInput then
				out_string("ERROR: No lines detected.")
			else
				if lineCount = 1 then
					out_string("ERROR: Odd number of lines detected.")
				else
					lineCount <- 0 
				fi
			fi;

			topS.init(nodes);

			topS.start();

			let stack : List <- topS.getStack() in{
				stack.print_list(stack.getHead(), stack.getLen());
			};

		}
	};
};

class Start inherits IO {

	init() : Start{
		{
			self;
		}
	};
	
	start_message() : Object { 
		{
			out_string("Please input task values.\n");
		}
	};
};
	

class Node inherits IO {
	task : String;
	dependentTask : String;
	visited : Bool;
	next : Node;

	init(t : String, dT : String) : Node{
		{
			task <- t;
			dependentTask <- dT;
			visited <- false;
			self;
		}
	}; 

	setNext(n : Node) : Object{
		{
			next <- n;
		}
	};

	setVisited(val : Bool) : Object{
		{
			visited <- val;
		}
	};

	getTask() : String{
		{
			task;
		}
	};

	getVisit() : Bool{
		{
			visited;
		}
	};
	
	getDependentTask() : String{
		{
			dependentTask;
		}
	};

	getNext() : Node{
		{
			next;
		}
	};
};

class List inherits IO{
	head : Node;
	tail : Node;
	len : Int;

	init(h : Node) :  List{
		{
			head <- h;
			len <- 1;
			self;
		}
	};

	getHead() : Node{
		{
			head;
		}
	};

	getLen() : Int{
		{
			len;
		}
	};

	append(n : Node) : Object {
		{
			if isvoid tail then{
				head.setNext(n);
			}
			else{
				tail.setNext(n);
			}
			fi;

			tail <- n;
			len <- len + 1;
		}
	};
	
	print_list(currentNode: Node, index : Int) : Object{
		{
			
			if not isvoid currentNode.getNext() then{
				print_list(currentNode.getNext(), index - 1);
				out_string(currentNode.getDependentTask());
				out_string("\n");
			}
			else{
				out_string(currentNode.getDependentTask());
				out_string("\n");
			}
			fi;

			if index = len then{
				out_string(currentNode.getTask());
			}
			else{
				1;
			}
			fi;
		}
	};
};

class TopSort inherits IO{

	foundMatch : Bool;
	nodes : List;
	stack : List;

	init(n : List) : TopSort{
		{
			nodes <- n;
			self;
		}
	};

	start() : Object{
		{
			let n : Node <- nodes.getHead() in {
				while not isvoid n loop{
					if not n.getVisit() then{
						self.topSort(n);
					}
					else{
						1;
					}
					fi;
					n <- n.getNext();
				} pool;
			};
		}
	};

	topSort(node : Node) : Object{
		{
			node.setVisited(true);
			let 
				foundMatch : Bool <- false,
				n : Node <- nodes.getHead()
			in{
				while not isvoid n loop{
					if n.getDependentTask() = node.getTask() then{
						if not n.getVisit() then{
							foundMatch <- true;
							self.topSort(n);

							if isvoid stack then{
								stack <- new List;
								let nodeCopy : Node <- new Node in{
									nodeCopy.init(node.getTask(), node.getDependentTask());
									stack.init(nodeCopy);	
								};
							}
							else{
								let nodeCopy : Node <- new Node in{
									nodeCopy.init(node.getTask(), node.getDependentTask());
									stack.append(nodeCopy);	
								};
							}
							fi;
						}
						else{
							1;
						}
						fi;
					}
					else{
						1;
					}
					fi;
					n <- n.getNext();
				} pool;
				if not foundMatch then{
				if isvoid stack then{
					stack <- new List;
					let nodeCopy : Node <- new Node in{
						nodeCopy.init(node.getTask(), node.getDependentTask());
						stack.init(nodeCopy);	
					};
				}
				else{
					let nodeCopy : Node <- new Node in{
						nodeCopy.init(node.getTask(), node.getDependentTask());
						stack.append(nodeCopy);	
					};
				}
				fi;
				}
				else{
					1;
				}
				fi;
			};
		}
	};

	getStack() : List{
		{
			stack;
		}
	};
};