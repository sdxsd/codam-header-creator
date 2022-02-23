#!/usr/bin/env bash

HEADER='/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   CODAM C FILE                                       :+:    :+:            */
/*                                                     +:+                    */
/*   By: USER     <USER@student.codam.nl>             +#+                     */
/*                                                   +#+                      */
/*   Created: 1970/01/01 00:00:00 by USER          #+#    #+#                 */
/*   Updated: 1970/01/01 00:00:00 by USER          ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */
'

ADD_HEADER() {
	NORM_VAR=$(norminette "$1" | grep "INVALID_HEADER")
	if [ "$NORM_VAR" = "" ]; then
		echo "VALID HEADER EXISTS: $1"
	else
		echo "HEADER ADDED: $1"
		cp "$1" "$1.cp"
		echo "$HEADER" > "$1"
		cat "$1.cp" >> "$1"
		rm "$1.cp"
	fi
}

for file in $(find src -type f)
do
	ADD_HEADER $file
done
