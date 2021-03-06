/**
 * http://wiki.developers.facebook.com/index.php/Data.defineAssociation
 * FEB 24.09
 */ 
/*
  Copyright (c) 2009, Adobe Systems Incorporated
  All rights reserved.

  Redistribution and use in source and binary forms, with or without 
  modification, are permitted provided that the following conditions are
  met:

  * Redistributions of source code must retain the above copyright notice, 
    this list of conditions and the following disclaimer.
  
  * Redistributions in binary form must reproduce the above copyright
    notice, this list of conditions and the following disclaimer in the 
    documentation and/or other materials provided with the distribution.
  
  * Neither the name of Adobe Systems Incorporated nor the names of its 
    contributors may be used to endorse or promote products derived from 
    this software without specific prior written permission.

  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
  IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
  THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
  PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR 
  CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
  EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
  PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
  PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
  LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
  NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/
package com.facebook.commands.data {
	
	import com.facebook.data.InternalErrorMessages;
	import com.facebook.data.data.AssocInfoData;
	import com.facebook.net.FacebookCall;
	import com.facebook.utils.FacebookDataUtils;
	import com.facebook.utils.ValidationUtils;
	import com.facebook.facebook_internal;

	use namespace facebook_internal;

	/**
	 * The DefineAssociation class represents the public  
      Facebook API known as Data.defineAssociation.
	 * @see http://wiki.developers.facebook.com/index.php/Data.defineAssociation
	 */
	public class DefineAssociation extends FacebookCall {

		
		public static const METHOD_NAME:String = 'data.defineAssociation';
		public static const SCHEMA:Array = ['name', 'assoc_type', 'assoc_info1', 'assoc_info2', 'inverse'];
		
		protected var name:String;
		protected var assoc_type:Number;
		protected var assoc_info1:AssocInfoData;
		protected var assoc_info2:AssocInfoData;
		protected var inverse:String;
		
		public function DefineAssociation(name:String, assoc_type:Number, assoc_info1:AssocInfoData, assoc_info2:AssocInfoData, inverse:String) {
			super(METHOD_NAME);
			
			if (ValidationUtils.isDataObjectTypeValid(name) == false) {
				throw new RangeError(FacebookDataUtils.supplantString(InternalErrorMessages.DATA_INVALID_NAME_ERROR, {propName:name}));
			}
			if(ValidationUtils.isDataObjectTypeValid(inverse) == false) {
				throw new RangeError(FacebookDataUtils.supplantString(InternalErrorMessages.DATA_INVALID_NAME_ERROR, {propName:inverse}));
			}
			
			this.name = name;
			this.assoc_type = assoc_type;
			this.assoc_info1 = assoc_info1;
			this.assoc_info2 = assoc_info2;
			this.inverse = inverse;
		}
		
		override facebook_internal function initialize():void {
			applySchema(SCHEMA, name, assoc_type, assoc_info1, assoc_info2,inverse);
			super.facebook_internal::initialize();
		}
	}
}