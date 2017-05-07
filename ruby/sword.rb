	require 'sword2ruby'

	SWORD_USER = 'sword'
	SWORD_PASS = ''
	SWORD_OBO = 'joshw'

	#Print out the version number
	puts "Running Sword2Ruby version #{Sword2Ruby::VERSION}"

	#Define the authentication credentials for the connection
	sword_user = Sword2Ruby::User.new(SWORD_USER, SWORD_PASS, SWORD_OBO)

	#Define the connection object using the username and password
	connection = Sword2Ruby::Connection.new(sword_user)

	#Get the Service Document
	service = Atom::Service.new('https://na01.alma.exlibrisgroup.com/sword/TR_INTEGRATION_INST/sd', connection)

	#Print out some properties for the Service
	puts "service.sword_version: #{service.sword_version}"
	puts "service.sword_max_upload_size: #{service.sword_max_upload_size}"
	puts "service.workspaces.count: #{service.workspaces.count}"
	puts "service.collections.count: #{service.collections.count}"

	#Get a collection
	collection = service.collections.last

	entry = Atom::Entry.new
	entry.add_dublin_core_extension! "title", "Test from Ruby"
	entry.add_dublin_core_extension! "creator", "Josh Weisman"

	#Post a file to the collection
	deposit_receipt = collection.post_multipart!(
		:entry=>entry,
		:filepath=>'./sword.pptx', #Downloads.zip', 
		:content_type=>"application/vnd.openxmlformats-officedocument.presentationml.presentation", #application/zip", 
		:packaging=>"http://purl.org/net/sword/package/Binary", #SimpleZip",
		:on_behalf_of=>SWORD_OBO		
		)

	#Print out the deposit receipt
	puts "deposit_receipt.has_entry: #{deposit_receipt.has_entry}"
	puts "deposit_receipt.entry.to_s: #{deposit_receipt.entry.to_s}"

