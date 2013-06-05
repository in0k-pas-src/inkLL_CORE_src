unit inkLL_node;
{<*** Linked Lists NODE [ in0k © 28.05.2013 ]
    * Узел СВЯЗАННОГО списка
    *}
{//..........................................................................///
///                                      _                                   ///
///                      __ __ ___ ___ _| |___node->-                        ///
///                     |  |  |   | . | . | -_| next->                       ///
///                     |  |_ |_|_|___|___|___|     -                        ///
///                     |____|___| Linked Lists     =                        ///
///                                                                          ///
///--------------------------------------------------------------------------//}
interface
{%region /fold}//----------------------------------[ compiler directives ]
{}  {$ifdef fpc}                                             { это для LAZARUS }
{}     {$mode delphi}     // для пущей совместимости написанного кода         {}
{}     {$define _INLINE_}                                                     {}
{}  {$else}                                                   { это для DELPHI }
{}     {$IFDEF SUPPORTS_INLINE}                                               {}
{}       {$define _INLINE_}                                                   {}
{}     {$endif}                                                               {}
{}  {$endif}                                                                  {}
{}  {$ifOpt D+} // режим дебуга ВКЛЮЧЕН                      { "боевой" INLINE }
{}       {$undef _INLINE_} // дeбугить просче БЕЗ INLIN`а                     {}
{}  {$endif}                                                                  {}
{%endregion}//-------------------------------------------[ compiler directives ]

type

  {УЗЕЛ связного списка }
 rInkNodeLL=record
    next:pointer;  //< ссылка-указатель на следующий элемент очереди
  end;

  {УКАЗАТЕЛЬ на УЗЕЛ связного списка }
 pInkNodeLL=^rInkNodeLL;

type

  {"callBack" при УНИЧТОЖЕНИИ !!! СТАТИЧЕСКАЯ функция !!!
    @param(NODE указатель на УЗЕЛ списка [pInkNodeLL])  }
 fInkNodeLL_doDispose=procedure(const NODE:pointer);
  {"callBack" при обходе очереди !!! метод ОБЪЕКТА-класса !!!
    @param(NODE указатель на УЗЕЛ очереди [pInkNodeLL]) }
 aInkNodeLL_doDispose=procedure(const NODE:pointer) of object;

  {"callBack" обработать Узел при обходе очереди !!! СТАТИЧЕСКАЯ функция !!!
    @param (Data АДРЕС-памяти, некая инфа используемая при обходе)
    @param (NODE это ссылка-указатель на УЗЕЛ очереди [pQueueNode])
    @return(continue @true -- продолжить обход; @false -- ПРЕКРАТИТЬ)  }
 fInkNodeLL_doProcess=function(const Context:pointer; const NODE:pointer):boolean;
  {"callBack" обработать Узел при обходе очереди !!! метод ОБЪЕКТА-класса !!!
    @param (Data АДРЕС-памяти, некая инфа используемая при обходе)
    @param (NODE это ссылка-указатель на УЗЕЛ очереди [pQueueNode])
    @return(@true -- продолжить обход; @false -- ПРЕКРАТИТЬ)  }
 aInkNodeLL_doProcess=function(const Context:pointer; const NODE:pointer):boolean;

type

 tInkLLNodeIndex=NativeUint;
 tInkLLNodeCount=tInkLLNodeIndex;

const
 cInkNodeLL_MaxCount=high(tInkLLNodeCount);
 cInkNodeLL_NdfIndex=cInkNodeLL_MaxCount;
 cInkNodeLL_MaxIndex=cInkNodeLL_NdfIndex-1;

function  InkNodeLL_getNext(const node:pointer):pointer;                        {$ifdef _INLINE_} inline; {$endif}
procedure InkNodeLL_setNext(const node,next:pointer);                           {$ifdef _INLINE_} inline; {$endif}

implementation

{[УЗЕЛ связного списка] вернуть указатель на следующий}
function InkNodeLL_getNext(const node:pointer):pointer;
begin
    result:=pInkNodeLL(Node)^.next;
end;

{[УЗЕЛ связного списка] установить следующим элементом}
procedure InkNodeLL_setNext(const node,next:pointer);
begin
    pInkNodeLL(Node)^.next:=next;
end;

end.

{//---[ in0k © 29.05.2013 ]--------------------------------------------------///
    отпочковалась откуда-то
///--------------------------------------------------------------------------//}

