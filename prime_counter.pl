% Prime number checker
is_prime(2).
is_prime(N) :-
    N > 2,
    MaxDiv is floor(sqrt(N)),
    \+ (between(2, MaxDiv, Div), N mod Div =:= 0).

% Helper predicate to count primes in a range
count_primes_in_range(Low, High, Count) :-
    findall(X, (between(Low, High, X), is_prime(X)), Primes),
    length(Primes, Count).

% Input validation
validate_input(Input) :-
    integer(Input), Input >= 0, !.
validate_input(Input) :-
    \+ integer(Input),
    write('Error: Input must be an integer.'), nl, fail.
validate_input(Input) :-
    Input < 0,
    write('Error: Input must be a non-negative integer.'), nl, fail.

% Main predicate
prime_counter(Range) :-
    (validate_input(Range) ->
        count_primes_in_range(0, Range, Count),
        format('Output: ~w', [Count])
    ;   fail). % Ensure that the entire predicate fails on invalid input
