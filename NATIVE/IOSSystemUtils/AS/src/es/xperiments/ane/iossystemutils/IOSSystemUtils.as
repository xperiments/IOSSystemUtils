			//
			//  IOSSystemUtils.as
			//
			//  Created by ANEBridgeCreator on 04/02/2013.
			//  Copyright (c)2013 ANEBridgeCreator. All rights reserved.
			//
			package es.xperiments.ane.iossystemutils
			{
				import flash.events.EventDispatcher;
				import flash.events.StatusEvent;
				import flash.external.ExtensionContext;
				
				
				public class IOSSystemUtils extends EventDispatcher
				{
					/**
					 * Declare static context
					 */
					private static var __context:ExtensionContext = null;
					
					/**
					 * Declare private accesors vars
					 */
					
					/**
					 * IOSSystemUtils Constructor
					 */
					public function IOSSystemUtils( )
					{
						if ( !__context )
						{
							__context = ExtensionContext.createExtensionContext("es.xperiments.ane.iossystemutils.IOSSystemUtils","es.xperiments.ane.iossystemutils.IOSSystemUtils");
						}
					}
					
					/**
					* @return Number
					*/
					public function getBrightness( ):Number
					{
						return	__context.call( 'getBrightness') as Number;
					};
					
					/**
					* @param badgeCount:uint
					* @return void
					*/
					public function setBadgeNumber( badgeCount:uint):void
					{
						__context.call( 'setBadgeNumber',badgeCount) ;
					};
					
					/**
					* @param brightness:Number
					* @return void
					*/
					public function setBrightness( brightness:Number):void
					{
						__context.call( 'setBrightness',brightness) ;
					};
					
					/**
					* @param enabled:Boolean
					* @return void
					*/
					public function setTorchEnabled( enabled:Boolean):void
					{
						__context.call( 'setTorchEnabled',enabled) ;
					};
					
					
					
					/**
					 * GETTERS/SETTERS
					 */
					
					
					/**
					 * Check if the extension is supported
					 * @return Boolean
					 */
					public static function get isSupported():Boolean
					{
						return true;
					}
					
					/**
					 * Dispose the IOSSystemUtils extension
					 */
					public function dispose():void
					{
						if( __context.hasEventListener(StatusEvent.STATUS) ) __context.removeEventListener(StatusEvent.STATUS,onContextStatusEvent);
						__context.dispose();
						__context = null;
					}
					
					/**
					 * Main Native Event Listener
					 */
					private function onContextStatusEvent( e:StatusEvent ):void
					{
						switch( e.level )
						{
							default:
							
							break;
						}
					}
				}
				
			}
		