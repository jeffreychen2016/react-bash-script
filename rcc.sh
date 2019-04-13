#!/bin/bash
# this script is created for auto-creating files for new react component
# implementation: bash rcc componentName [-c/-f]

# store parameters into variable
componentName=$1
boilerplateFlag=$2

# capitalize the first letter of the component name
component="${componentName^}"

# check the user input
if [ $# -ne 2 ]; 
then
    echo "Illegal number of parameters, it requires 2 parameters, first one is the component name, sencond one is for the type of JS boilplate."
    exit 1
fi

# use && instead of ||, it means:
# not(A || B || C) => not(A) && not(B) && not (C)
# the rules for these equivalents are called De Morgan's laws 
if [ "$boilerplateFlag" != "-c" ] && [ "$boilerplateFlag" != "-f" ];
then
    echo "Invalid parameters, please use either -c or -f for the type of boilerplate that you want to create."
    exit 1
fi

# check if files already exist
if [ -d ./$component ];
then 
    echo "Files with same component name already exist."
    exit 1
fi

# creating component directory and component files
mkdir ./$component
touch $component/$component.js
touch $component/$component.css

# generating boilerplate to js file - functional based component
jsBoilerplateFB=$(cat << EOF
import React from 'react';
import './$component.css';

const $component = (props) => {
    return (
        <div className="$component">
            <h1>$component component</h1>
        </div>
    );
};

export default $component
EOF
)

# generating boilerplate to js file - class based component
jsBoilerplateCB=$(cat << EOF
import React from 'react';
import './$component.css';

class $component extends React.Component {
    render () {
        return (
            <div className="$component">
                <h1>$component component</h1>
            </div>
        )
    }
}

export default $component;
EOF
)

# generating bolierplate to css file
cssBoilerplate=$(cat << EOF
.$component {
    background-color: green;
}
EOF
)

# generating boilerplate based on the parapmeter -c/-f
# if -c is provided, then the js file with class based boilerplate will be generated
# if -f is provided, then the js file with functional based boilerplate will be generated 
# use printf here to print multiple lines of string
if [ "$boilerplateFlag" == "-c" ];
then 
    printf "$jsBoilerplateCB" > $component/$component.js
elif [ "$boilerplateFlag" == "-f" ];
then
    printf "$jsBoilerplateFB" > $component/$component.js
fi

printf "$cssBoilerplate" > $component/$component.css
echo "component files have been created successfully!"
