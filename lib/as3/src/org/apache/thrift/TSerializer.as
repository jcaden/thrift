/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements. See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership. The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License. You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied. See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

package org.apache.thrift {
	import flash.utils.ByteArray;

	import org.apache.thrift.protocol.TBinaryProtocol;
	import org.apache.thrift.protocol.TProtocol;
	import org.apache.thrift.transport.TMemoryBuffer;
	import org.apache.thrift.transport.TTransport;

	public class TSerializer {
		private var _protocol:TProtocol;
		private var _transport:TTransport;

		public function TSerializer() {
			_transport = new TMemoryBuffer();
			_protocol = new TBinaryProtocol( _transport );
		}

		public function serialize( message:TBase ):ByteArray {
			( _transport as TMemoryBuffer ).reset();
			message.write( _protocol );
			return ( _transport as TMemoryBuffer ).getArray();
		}

		public function toString( message:TBase ):String {
			return serialize( message ).toString();
		}
	}
}
