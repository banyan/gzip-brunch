describe "Plugin", ->
  beforeEach ->
    @plugin = new Plugin
      paths:
        public: 'public'

  it "should be an object", ->
    expect(@plugin).to.be.ok

  it "should has #onCompile method", ->
    expect(@plugin.onCompile).to.be.an.instanceof(Function)

  describe 'constructor', ->
    context 'when default', ->
      it "should have targets", ->
        expect(@plugin.targets[0].path).to.be.eql 'public'
        expect(@plugin.targets[1].path).to.be.eql 'public'
        expect(@plugin.targets[2].path).to.be.eql 'public'

    context 'when configured', ->
      beforeEach ->
        @plugin = new Plugin
          paths:
            public: 'public'
          plugins:
            gzip:
              paths:
                javascript: 'js'
                stylesheet: 'css'

      it "should have targets", ->
        expect(@plugin.targets[0].path).to.be.eql 'public'
        expect(@plugin.targets[1].path).to.be.eql 'public/js'
        expect(@plugin.targets[2].path).to.be.eql 'public/css'
