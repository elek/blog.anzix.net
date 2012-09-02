---
layout: post
title: Generics + reflecion
tags: []
status: publish
type: post
published: true
meta:
  blogger_blog: problemjava.blogspot.com
  blogger_author: kareninhttp://www.blogger.com/profile/02683406828110839343noreply@blogger.com
  blogger_permalink: /2008/01/generics-reflecion.html
---
Tegnap ígértemhez híven: a generic típusok a bytecodeban benne vannak a
deklarációs részben, csak a utasításoknál nincsenek. Reflecionnal tehát
lekérdezhetőek.(Pontos speckó linket most nincs időm keresni, helyette itt a
példakód.)

  

    
    
    public class Main {
    
        public List<Double> list;
    
        public static void main(String[] args) throws Exception {
            Field field = Main.class.getDeclaredField("list");
            ParameterizedType ptype = (ParameterizedType) field.getGenericType();
            Type[] types = ptype.getActualTypeArguments();
            System.out.println(types[0]);
        }
    }
    

