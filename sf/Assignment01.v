(** **** SNU 4190.310, 2015 Spring *)

(** Assignment 01 *)
(** Due: 2015/03/19 14:00 *)

Definition admit {T: Type} : T.  Admitted.

(** **** Exercise: 1 star (andb3) *)
(** Do the same for the [andb3] function below. This function should
    return [true] when all of its inputs are [true], and [false]
    otherwise. *)

Definition andb3 (b1:bool) (b2:bool) (b3:bool) : bool :=
    match b1, b2 with
    | true, true => b3
    | _, _ => false
    end.
Example test_andb31:                 (andb3 true true true) = true.
simpl. reflexivity. Qed.

Example test_andb32:                 (andb3 false true true) = false.
simpl. reflexivity. Qed.

Example test_andb33:                 (andb3 true false true) = false.
simpl. reflexivity. Qed.

Example test_andb34:                 (andb3 true true false) = false.
simpl. reflexivity. Qed.
(** [] *)



(** **** Exercise: 1 star (factorial) *)
(** Recall the standard factorial function:
<<
    factorial(0)  =  1 
    factorial(n)  =  n * factorial(n-1)     (if n>0)
>>
    Translate this into Coq. 
    Note that plus and multiplication are already defined in Coq.
    use "+" for plus and "*" for multiplication.
*)

Eval compute in 3 * 5.
Eval compute in 3+5*6.

Fixpoint factorial (n:nat) : nat := 
    match n with
    | 0 => 1
    | S n' => n * factorial n'
end.

Example test_factorial1:          (factorial 3) = 6.
simpl. reflexivity. Qed.
 
Example test_factorial2:          (factorial 5) = 10 * 12.
simpl. reflexivity. Qed.
(** [] *)



(** **** Exercise: 2 stars (blt_nat) *)
(** The [blt_nat] function tests [nat]ural numbers for [l]ess-[t]han,
    yielding a [b]oolean.  Instead of making up a new [Fixpoint] for
    this one, define it in terms of a previously defined function.  
    
    Note: If you have trouble with the [simpl] tactic, try using
    [compute], which is like [simpl] on steroids.  However, there is a
    simple, elegant solution for which [simpl] suffices. *)
Eval compute in Prop.
Definition blt_nat :=
    fix recur_blt_nat(n m : nat) : bool :=
        match n, m with
        | 0, S m' => true
        | _, 0 => false
        | S n', S m' => recur_blt_nat n' m'
        end.

Example test_blt_nat1:             (blt_nat 2 2) = false.
simpl. reflexivity. Qed.

Example test_blt_nat2:             (blt_nat 2 4) = true.
simpl. reflexivity. Qed.

Example test_blt_nat3:             (blt_nat 4 2) = false.
simpl. reflexivity. Qed.
(** [] *)