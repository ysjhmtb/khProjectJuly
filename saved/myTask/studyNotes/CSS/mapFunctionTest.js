


var input = [[1,2,3], [4,5,6], [7,8,9]];


function mapTest(A){

    return A[0].map(


        (val, ind) => A.map(

            row => row[ind]
        )
    );
};




// [ [ 1, 4, 7 ], [ 2, 5, 8 ], [ 3, 6, 9 ] ]
console.log(mapTest(input));